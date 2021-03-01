import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String _label;
  final Function _onClick;

  const RectangleButton({
    @required String label,
    @required Function onClick,
    Key key,
  })  : _label = label,
        _onClick = onClick,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: RaisedButton(
          child: Text(_label),
          onPressed: _onClick,
        ),
      ),
    );
  }
}
