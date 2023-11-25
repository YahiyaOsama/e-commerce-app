class UserModel {
  String? userId, name, email, pic, width, height, age;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.pic,
    this.age,
    this.width,
    this.height,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    pic = map['pic'];
    width = map['width'];
    height = map['height'];
    age = map['age'];
  }

  toJson() {
    return {
      "userId": userId,
      "name": name,
      "email": email,
      "pic": pic,
      "width": width,
      "height": height,
      "age": age,
    };
  }
}
