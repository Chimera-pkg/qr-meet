part of 'widgets.dart';

class BTNChangeWidget extends StatelessWidget {
  Color colorSelect;
  IconData icon;
  dynamic onTap;
  bool active;

  BTNChangeWidget(
      {this.colorSelect, this.icon, this.onTap, this.active = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: active
              ? MaterialStateProperty.all<Color>(mainColor)
              : MaterialStateProperty.all<Color>(Colors.grey),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: active ? mainColor : Colors.grey)))),
      onPressed: () {
        onTap();
      },
      child: Icon(icon, color: Colors.white),
    );
  }
}
