class ProductModel {
  String? name, image, description, sized, price;

  ProductModel(
      {this.name, this.image, this.description, this.sized, this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    sized = map['sized'];
    price = map['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'sized': sized,
      'price': price,
    };
  }
}
