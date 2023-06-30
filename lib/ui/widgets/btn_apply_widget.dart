part of 'widgets.dart';

class BTNApplyWidget extends StatelessWidget {
  String title;
  dynamic onTap;

  BTNApplyWidget({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(mainColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: mainColor)))),
      onPressed: () {
        onTap();
      },
      child: Text(title,
          style: whiteTextFont.copyWith(
              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white)),
    );
  }
}
