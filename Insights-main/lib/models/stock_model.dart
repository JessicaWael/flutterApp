class Stock {
  final int assetId;
  final String assetName;
  final String symbol;
  final String sector;
  final String date;
  final double price;
  final double openPrice;
  final double chg;
  final double highPrice;
  final double lowPrice;
  final int volume;

  Stock({
    required this.assetId,
    required this.assetName,
    required this.symbol,
    required this.sector,
    required this.date,
    required this.price,
    required this.openPrice,
    required this.chg,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      assetId: json['AssetId'],
      assetName: json['AssetName'],
      symbol: json['Symbol'],
      sector: json['Sector'],
      date: json['Date'],
      price: json['Price'].toDouble(),
      openPrice: json['OpenPrice'].toDouble(),
      chg: json['CHG'].toDouble(),
      highPrice: json['HighPrice'].toDouble(),
      lowPrice: json['LowPrice'].toDouble(),
      volume: json['Volume'],
    );
  }
}
