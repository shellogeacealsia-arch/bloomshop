class Product {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String image;
  final bool isBestSeller;
  final bool isNewArrival;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.image,
    this.isBestSeller = false,
    this.isNewArrival = false,
  });
}