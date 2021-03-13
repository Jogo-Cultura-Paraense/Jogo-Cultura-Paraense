import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';

class HomeScaffold extends StatelessWidget {
  final Widget _body;
  final PreferredSizeWidget _appBar;
  const HomeScaffold({
    @required Widget body,
    PreferredSizeWidget appBar,
    Key key,
  })  : _body = body,
        _appBar = appBar,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (dynamic currentState, dynamic nextState) {
        return currentState.homeAssets.background !=
            nextState.homeAssets.background;
      },
      builder: (context, dynamic state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(state.homeAssets.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: _appBar,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: _body,
            ),
          ),
        );
      },
    );
  }
}
