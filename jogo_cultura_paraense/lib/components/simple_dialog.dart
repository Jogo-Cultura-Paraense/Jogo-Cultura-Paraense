import 'package:flutter/material.dart';

class CustomSimpleDialog extends StatelessWidget {
  final Text _title;
  final List<Widget> _children;
  final double _dialogHeight;
  final double _dialogWidht;
  final Widget _floatingChild;
  final double _floatingChildHeight;
  final double _floatingChildWidht;

  const CustomSimpleDialog({
    @required Text title,
    @required List<Widget> children,
    @required Widget floatingChild,
    double dialogHeight = 300,
    double dialogWidht = 400,
    double floatingChildHeight = 280,
    double floatingChildWidht = 400,
    Key key,
  })  : _title = title,
        _children = children,
        _floatingChild = floatingChild,
        _dialogHeight = dialogHeight,
        _dialogWidht = dialogWidht,
        _floatingChildHeight = floatingChildHeight,
        _floatingChildWidht = floatingChildWidht,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: _dialogHeight,
          width: _dialogWidht,
          child: SimpleDialog(
            backgroundColor: Theme.of(context).primaryColor,
            title: _title,
            children: _children,
            contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
            titlePadding: EdgeInsets.only(top: 30),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: _floatingChildHeight,
          width: _floatingChildWidht,
          alignment: Alignment.topCenter,
          child: _floatingChild,
        ),
      ],
    );
  }
}
