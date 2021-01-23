import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/components/loading_progress.dart';
import 'package:jogo_cultura_paraense/pages/home_page.dart';

class LoadingHomeAssets extends StatelessWidget {
  const LoadingHomeAssets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wait for widget to load then send event
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(LoadHomeAssets());
    });
    return BlocConsumer<HomeBloc, HomeState>(
      builder: (context, state) {
        return LoadingProgress(
          loadingFailed: state is HomeAssetsFailed,
          retryCallBack: () {
            BlocProvider.of<HomeBloc>(context).add(LoadHomeAssets());
          },
        );
      },
      listener: (context, dynamic state) {
        if (state is HomeAssetsFailed) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is HomeAssetsLoaded) {
          Navigator.of(context).popAndPushNamed(HomePage.routeName);
        }
      },
    );
  }
}
