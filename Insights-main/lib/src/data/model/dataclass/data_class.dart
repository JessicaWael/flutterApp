class MarketModel {
  final String? name;
  final String? price;
  final String? percentage;
  final String? image;
  bool isHide;

  MarketModel({
    this.isHide = false,
    required this.name,
    required this.price,
    required this.percentage,
    this.image = 'assets/images/placeholder-image.png',
  });
}
