part of 'widgets.dart';

Widget boxPalette({context, bool active, int i, Color color, onChange}) {
  return GestureDetector(
    onTap: () {
      ShowDialogColorPickerWidget(
          context: context,
          update: (e) {
            onChange(i, e);
          });
    },
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: active ? mainColor : Colors.white, width: 3),
      ),
    ),
  );
}
