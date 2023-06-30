part of 'shared.dart';

String baseUrl = "https://api.pictsnap.simhive.com";

String imageDefault =
    "https://firebasestorage.googleapis.com/v0/b/pictsnap-next.appspot.com/o/example.jpg?alt=media&token=06cf52ea-0783-4f2a-a10b-f244ae6ce411";

String imageLogo =
    "https://orbscape.simhive.com/storage/bucket/2/2/object_1636192758.png";

String imageThumbnail =
    "https://orbscape.simhive.com/storage/bucket/2/2/object_1636192768.png";

String imagePoster =
    "https://orbscape.simhive.com/storage/bucket/2/2/object_1636192728.png";

String imageBanner =
    "https://orbscape.simhive.com/storage/bucket/2/2/object_1636192745.png";

String imageHeaderLogo =
    "https://orbscape.simhive.com/storage/bucket/3/2/object_1645603689.png";

String tapToEdit = "Tap to edit";
String lorem = "";
String versionApp = "v 4.0.13";

Future<void> runUrl(url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
