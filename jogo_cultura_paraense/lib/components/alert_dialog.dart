import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Text _title;
  final Text _content;
  final double _dialogHeight;
  final double _dialogWidht;
  final Widget _floatingChild;
  final double _floatingChildHeight;
  final double _floatingChildWidht;

  const CustomAlertDialog({
    @required Text title,
    @required Text content,
    @required Widget floatingChild,
    double dialogHeight = 300,
    double dialogWidht = 400,
    double floatingChildHeight = 280,
    double floatingChildWidht = 400,
    Key key,
  })  : _title = title,
        _content = content,
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
          child: AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            title: _title,
            content: _content,
            titlePadding: EdgeInsets.only(top: 30),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            contentTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
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
