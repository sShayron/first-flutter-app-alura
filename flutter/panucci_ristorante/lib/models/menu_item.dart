class MenuItem {
  String image;
  String name;
  String price;
  String? description;

  MenuItem(
      {required this.image,
      required this.name,
      required this.price,
      this.description});
}
