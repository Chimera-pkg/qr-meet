part of 'components.dart';

Widget FrameComp(
    {left, right, top, bottom, width, height, svg}) {
  
  return Positioned(
      left: left?.toDouble(),
      top: top?.toDouble(),
      width: width?.toDouble(),
      height: height?.toDouble(),
      child: SvgPicture.string(
        svg,
      ));
}
