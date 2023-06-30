part of 'methods.dart';

Future<File> getImage() async {
  File imageFile;
  var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image == null) return null;

  imageFile = File(image.path);
  return imageFile;
}

Future<File> cropImage(File imageFile) async {
  CroppedFile cropped = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    compressFormat: ImageCompressFormat.jpg,
    compressQuality: 100,
  );

  File temp;

  if (cropped == null) {
    temp = null;
  } else {
    temp = File(cropped.path);
  }

  return temp;
}

Future<String> saveImage(Uint8List bytes) async {
  await [Permission.storage].request();

  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');

  final name = 'pictsnap_logo';
  final result = await ImageGallerySaver.saveImage(bytes, name: name);

  return result['filePath'];
}

Uint8List resizeImage(Uint8List data, int width, int heigth) {
  Uint8List resizedData = data;
  image.Image img = image.decodeImage(data);
  image.Image resized = image.copyResize(img, width: width, height: heigth);
  List<int> imageData = image.encodeJpg(resized);

  return Uint8List.fromList(imageData);
  ;
}
