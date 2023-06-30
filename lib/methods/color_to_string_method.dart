part of "methods.dart";

List<dynamic> ColorToStringMethod(colors) {
  List tempColors = new List(colors.length);

  for (int i = 0; i < colors.length; i++) {
    Color picker = colors[i];
    String p = picker.toString();
    tempColors[i] = p.split('(0xff')[1].split(')')[0];
  }
  return tempColors;
}
