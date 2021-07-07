import 'package:flutter/material.dart';

// This class created a transparent circular button
// It must be used inside a Stack widget
class TransparentCircleButton extends StatelessWidget {
  final double _top;
  final double _left;
  final Function _onPressed;

  const TransparentCircleButton({
    @required double top,
    @required double left,
    @required Function onPressed,
    Key key,
  })  : _top = top,
        _left = left,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _top,
      left: _left,
      width: 65,
      height: 65,
      child: ElevatedButton(
        child: Icon(Icons.circle, color: Colors.transparent),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: _onPressed,
      ),
    );
  }
}
