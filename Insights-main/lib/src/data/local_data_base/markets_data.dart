import 'package:app/src/data/model/dataclass/data_class.dart';

List<MarketModel> myMarkets = [
  MarketModel(
      name: '24K Gold',
      price: 'EGP 3,657.5',
      percentage: '-1.05 %',
      image: 'assets/images/gold_bars.png'),
  MarketModel(
      name: 'EGX 100 EWI', price: 'EGP 9,079.26', percentage: '-1.96 %'),
  MarketModel(name: 'EGX 70 ', price: 'EGP 6,399.02', percentage: '-1.80 %'),
  MarketModel(
      name: 'SPDR S&P 500 ETF',
      price: 'EGP 3,657.5',
      percentage: '.08 %',
      isHide: true),
  MarketModel(name: 'EGX 30', price: '27,559.35', percentage: '-2.36%')
];
