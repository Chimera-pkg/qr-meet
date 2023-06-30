part of 'widgets.dart';

Widget BodyDesignWidget({
  context,
  templates,
  selectedIndex,
  imageSrc,
  imageEditingController,
  textController,
  fontSizes,
  fontFamilys,
  colors,
  updateImage,
  updateText,
}) {
  return Stack(
    children: templates[selectedIndex].map<Widget>((e) {
      if (e["id"] == "frame_comp") {
        return FrameComp(
            top: e["top"],
            left: e["left"],
            // color: colors[e["groupColor"]],
            svg: e["svg"],
            width: e["width"],
            height: e["height"]);
      } else if (e["id"] == "image_logo_comp") {
        return ImageLogoComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            color: colors[e["groupColor"]],
            src: imageSrc[e['imageEditingController']],
            imageEditingController:
                imageEditingController[e['imageEditingController']],
            update: (v) => {updateImage(e['imageEditingController'], v)});
      } else if (e["id"] == "image_square_comp") {
        return ImageSquareComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            border: e["border"],
            color: colors[e["groupColor"]],
            src: imageSrc[e['imageEditingController']],
            imageEditingController:
                imageEditingController[e['imageEditingController']],
            update: (v) => {updateImage(e['imageEditingController'], v)});
      } else if (e["id"] == "image_square_rounded_comp") {
        return ImageSquareRoundedComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            border: e["border"],
            rounded: e["rounded"],
            color: colors[e["groupColor"]],
            src: imageSrc[e['imageEditingController']],
            imageEditingController:
                imageEditingController[e['imageEditingController']],
            update: (v) => {updateImage(e['imageEditingController'], v)});
      } else if (e["id"] == "image_circle_comp") {
        return ImageCircleComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            border: e["border"],
            color: colors[e["groupColor"]],
            src: imageSrc[e['imageEditingController']],
            imageEditingController:
                imageEditingController[e['imageEditingController']],
            update: (v) => {updateImage(e['imageEditingController'], v)});
      } else if (e["id"] == "image_static_comp") {
        return ImageStaticComp(
          left: e["left"],
          top: e["top"],
          width: e["width"],
          height: e["height"],
          src: e['src'],
        );
      } else if (e["id"] == "container_square_comp") {
        return ContainerSquareComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            color: colors[e["groupColor"]],
            border: e["border"],
            update: () {});
      } else if (e["id"] == "container_square_rounded_comp") {
        return ContainerSquareRoundedComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            color: colors[e["groupColor"]],
            border: e["border"],
            rounded: e["rounded"],
            update: () {});
      } else if (e["id"] == "container_circle_comp") {
        return ContainerCircleComp(
            left: e["left"],
            top: e["top"],
            width: e["width"],
            height: e["height"],
            color: colors[e["groupColor"]],
            border: e["border"],
            update: () {});
      } else if (e["id"] == "text_comp") {
        return TextComp(
            context: context,
            textController: textController[e['textController']],
            fontSize: fontSizes[e['textController']],
            text: textController[e['textController']].text,
            fontWeight: e["fontWeight"],
            color: colors[e["groupColor"]],
            textAlign: e["textAlign"],
            width: e["width"] == 0 ? null : e["width"],
            height: e["height"] == 0 ? null : e["height"],
            top: e["top"],
            left: e["left"],
            right: e["right"],
            fontFamily: fontFamilys[e['textController']],
            update: (fSize, fFamily) {
              updateText(e['textController'], fSize, fFamily);
            });
      } else {
        return SizedBox();
      }
    }).toList(),
  );
}
