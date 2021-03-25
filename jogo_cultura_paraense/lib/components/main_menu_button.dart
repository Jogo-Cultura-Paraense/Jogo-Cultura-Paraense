import 'package:flutter/material.dart';

// Widget modelo para criar botões no menu
class MainMenuButton extends StatelessWidget {
  final String _label;
  final Function _onClick;

  const MainMenuButton({
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
        child: ElevatedButton(
          child: Text(_label),
          onPressed: _onClick,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
