import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/bloc/cooking_game_bloc.dart';
import 'package:jogo_cultura_paraense/games/cooking_game/tapper_box.dart';

class TapperWidget extends StatelessWidget {
  final double height;
  final double width;
  final double top;

  const TapperWidget({
    this.height,
    this.width,
    this.top,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CookingGameBloc, CookingGameState>(
      buildWhen: (previousState, currentState) => false,
      builder: (context, state) {
        return TapperBox(
          context: context,
          orders: state.orders,
          height: height ?? deviceHeight,
          width: width ?? deviceWidth,
          top: top ?? 0,
        ).widget;
      },
    );
  }
}
