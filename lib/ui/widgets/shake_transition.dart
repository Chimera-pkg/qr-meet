part of 'widgets.dart';

class ShakeTransition extends StatelessWidget {
  const ShakeTransition(
      {Key key,
      this.duration = const Duration(milliseconds: 1000),
      this.offset = 20.0,
      @required this.child})
      : super(key: key);

  final Widget child;
  final Duration duration;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: child,
      duration: duration,
      curve: Curves.bounceOut,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * offset, 0.0),
          child: child,
        );
      },
    );
  }
}
