part of 'components.dart';

Widget ContainerSquareComp(
    {left, right, top, bottom, width, height, color, border = 10.0, update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: Container(
      width: width?.toDouble(),
      height: height?.toDouble(),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color, width: border?.toDouble() ?? 0),
      ),
    ),
  );
}

Widget ContainerSquareRoundedComp(
    {left,
    right,
    top,
    bottom,
    width,
    height,
    color,
    border = 10.0,
    rounded = 10.0,
    update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: Container(
      width: width?.toDouble(),
      height: height?.toDouble(),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color, width: border?.toDouble() ?? 0),
        borderRadius: BorderRadius.circular(rounded?.toDouble() ?? 0),
      ),
    ),
  );
}

Widget ContainerCircleComp(
    {left, right, top, bottom, width, height, color, border = 10.0, update}) {
  return Positioned(
    left: left?.toDouble(),
    right: right?.toDouble(),
    top: top?.toDouble(),
    bottom: bottom?.toDouble(),
    child: Container(
      width: width?.toDouble(),
      height: height?.toDouble(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: color, width: border?.toDouble() ?? 0),
      ),
    ),
  );
}
