import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purchases/model/user_model.dart';

class FirestoreUser {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await userCollection.doc(userModel.userId).set(userModel.toJson());
  }
}
