part of 'widgets.dart';

AppBar AppBarWidget({title, actionDownload}) {
  return (AppBar(
    title: Text(title,
        style:
            blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF023047),
    elevation: 0,
    actions: [
      GestureDetector(
        onTap: () => {actionDownload()},
        child: Icon(
          Icons.download_rounded,
          color: accentColor2,
          size: 30.0,
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ],
  ));
}
