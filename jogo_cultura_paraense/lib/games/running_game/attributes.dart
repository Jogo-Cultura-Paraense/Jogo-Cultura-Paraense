library globals;

import 'package:jogo_cultura_paraense/games/running_game/LifeBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/TargetsBox.dart';
import 'package:jogo_cultura_paraense/games/running_game/mainLendasMitos.dart';
import 'package:jogo_cultura_paraense/games/running_game/HintsBox.dart';
double score = 0.0;
int lives = 3;


mainLendasMitosScreen temp;
LifeBoxScreen temp2;
TargetsBoxScreen temp3;
HintsBoxScreen temp4;


main() {
  temp = new mainLendasMitosScreen();
  temp2 = new LifeBoxScreen();
  temp3 = new TargetsBoxScreen();
  temp4 = new HintsBoxScreen();
}


