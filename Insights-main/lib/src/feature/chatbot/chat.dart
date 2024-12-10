import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataSector {
  final String name;
  final String image;
  final String description;
  final String profit;
  final bool isBlue;

  DataSector({
    required this.name,
    required this.image,
    required this.description,
    required this.profit,
    required this.isBlue,
  });
}

List<DataSector> items = [
  DataSector(
    name: "ADIB",
    image: 'assets/images/bank1.png',
    description: "Abu Dhabi Islamic Bank - Egypt",
    profit: "2.92%",
    isBlue: false,
  ),
  DataSector(
    name: "CIB",
    image: 'assets/images/bank2.png',
    description: "Commercial International Bank-Egypt",
    profit: "-0.26%",
    isBlue: false,
  ),
  DataSector(
    name: "SWDY",
    image: 'assets/images/industrial1.png',
    description: "El Sewedy Electric",
    profit: "-0.91%",
    isBlue: false,
  ),
  DataSector(
    name: "AUTO",
    image: 'assets/images/industrial2.png',
    description: "GB corp",
    profit: "8.77%",
    isBlue: false,
  ),
];

class DataSectorItem extends StatelessWidget {
  final DataSector dataSector;

  DataSectorItem({required this.dataSector});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PredictionScreen(dataSector: dataSector),
          ),
        );
      },
      child: Card(
        color: dataSector.isBlue ? Colors.blue : Colors.white,
        child: ListTile(
          leading: Image.asset(dataSector.image),
          title: Text(dataSector.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(dataSector.description), Text(dataSector.profit)],
          ),
        ),
      ),
    );
  }
}

class DataSectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Sectors'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return DataSectorItem(dataSector: items[index]);
        },
      ),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  final DataSector dataSector;

  PredictionScreen({required this.dataSector});

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  String? stockData;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadStockData();
  }

  Future<void> _loadStockData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      stockData = prefs.getString('${widget.dataSector.name}_stockData');
    });
  }

  Future<void> _saveStockData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('${widget.dataSector.name}_stockData', stockData ?? '');
    print(widget.dataSector.name);
  }

  Future<void> _fetchStockData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var url = Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=${widget.dataSector.name}&interval=1min&apikey=YOUR_API_KEY');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var stockDataValue = json.decode(response.body);
        setState(() {
          stockData = json.encode(stockDataValue);
        });
        await _saveStockData();
      } else {
        throw Exception('Failed to load stock data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Data for ${widget.dataSector.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stock Data for ${widget.dataSector.name}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Description: ${widget.dataSector.description}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Current Profit: ${widget.dataSector.profit}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 32),
              if (isLoading)
                CircularProgressIndicator()
              else if (stockData != null)
                Text(
                  'Stock Data: $stockData',
                  style: TextStyle(fontSize: 18),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _fetchStockData,
                child: Text('Get Stock Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}