part of 'services.dart';

class FirebaseStorageServices {
  static Future<dynamic> uploadImage(File image, String email) async {
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child(email +
        "/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".jpg");

    final res = await mountainsRef.putFile(image);
    final url = await mountainsRef.getDownloadURL();

    return url;
  }
}
