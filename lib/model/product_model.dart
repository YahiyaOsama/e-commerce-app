class ProductModel {
  late String name, image, gender, id, weight, price;

  ProductModel({
    required this.name,
    required this.image,
    required this.id,
    required this.gender,
    required this.price,
    required this.weight,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    id = map['id'];
    gender = map['gender'];
    price = map['price'];
    weight = map['weight'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'id': id,
      'gender': gender,
      'price': price,
      'weight': weight,
    };
  }
}
