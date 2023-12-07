class UserModel {
  String? userId, name, email, pic, weight, height, age;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.pic,
    this.age,
    this.weight,
    this.height,
  });

  UserModel.fromJson(Map<String, dynamic> map) {
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    pic = map['pic'];
    weight = map['weight'];
    height = map['height'];
    age = map['age'];
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "pic": pic,
      "weight": weight,
      "height": height,
      "age": age,
    };
  }
}
