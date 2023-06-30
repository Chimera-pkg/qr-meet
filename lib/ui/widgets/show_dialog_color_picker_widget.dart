part of 'widgets.dart';

// create some values
Color pickerColor = Color(0xff443a49);
Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
dynamic ShowDialogColorPickerWidget({context, update}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (e) {
                update(e);
              },
            ),
          ),
        );
      });
}
