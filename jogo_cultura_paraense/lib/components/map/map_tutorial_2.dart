import 'package:flutter/material.dart';
import 'package:jogo_cultura_paraense/components/main_menu_button.dart';

class MapSecondTutorial extends StatefulWidget {
  final Function _onClick;

  const MapSecondTutorial({
    @required Function onClick,
    Key key,
  })  : _onClick = onClick,
        super(key: key);

  @override
  _MapSecondTutorialState createState() => _MapSecondTutorialState();
}

class _MapSecondTutorialState extends State<MapSecondTutorial> {
  int currentText = 0;

  List<String> _buildTexts() {
    return <String>[
      'A seguir, você jogará o primeiro jogo desse mapa!',
      'Está Pronto? Clique no botão acima para iniciar o Jogo.',
    ];
  }

  List<Widget> _buildChildren(List<String> texts) {
    Function onPressed = () {};
    final actions = <Widget>[];
    final list = <Widget>[];
    if (currentText != texts.length - 1) {
      onPressed = () {
        setState(() {
          currentText += 1;
        });
      };
      actions.add(
        IconButton(icon: Icon(Icons.forward), onPressed: onPressed),
      );
    } else {
      list.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: MainMenuButton(label: 'Jogar', onClick: widget._onClick),
        ),
      );
    }

    list.add(
      AlertDialog(
        buttonPadding: EdgeInsets.zero,
        backgroundColor: Color.fromRGBO(233, 213, 136, 1),
        content: Text(texts[currentText], textAlign: TextAlign.center),
        actions: actions,
      ),
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    print(currentText);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildChildren(_buildTexts()),
      ),
    );
  }
}
