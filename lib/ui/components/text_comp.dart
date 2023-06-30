part of 'components.dart';

Widget TextComp(
    {context,
    textController,
    left,
    right,
    top,
    bottom,
    width,
    height,
    color,
    border = 10.0,
    text = "Text Flutter",
    fontSize = 16.0,
    textAlign = "center",
    fontWeight = "normal",
    fontFamily = "Poppins",
    update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: GestureDetector(
      onTap: () {
        ShowMaterialFormTextDialog(
            context: context,
            title: "Text Editor",
            textController: textController,
            titleAction: "Simpan",
            action: (text, size, family) => {
                  fontSize = int.parse(size)?.toDouble(),
                  update(fontSize, family),
                  Navigator.pop(context),
                },
            titleCancel: "Tutup",
            cancel: () => {Navigator.pop(context)},
            field: "",
            fontSize: fontSize.toInt(),
            fontFamily: fontFamily);
      },
      child: Container(
        width: width?.toDouble(),
        height: height?.toDouble(),
        child: Text(textController.text == "" ? text : textController.text,
            maxLines: 20,
            style: getFontFamily(fontFamily).copyWith(
                color: color,
                fontSize: fontSize.toDouble(),
                fontWeight: fontWeight == "semibold"
                    ? FontWeight.normal
                    : fontWeight == "bold"
                        ? FontWeight.bold
                        : FontWeight.w400),
            textAlign: textAlign == "center" || true
                ? TextAlign.center
                : textAlign == "left"
                    ? TextAlign.left
                    : textAlign == "right"
                        ? TextAlign.right
                        : TextAlign.justify),
      ),
    ),
  );
}
