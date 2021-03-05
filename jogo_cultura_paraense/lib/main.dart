import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/encyclopedia/encyclopedia_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/home/home_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/map/map_bloc.dart';
import 'package:jogo_cultura_paraense/bloc/save/save_bloc.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';
import 'package:jogo_cultura_paraense/services/encyclopedia_service.dart';
import 'app.dart';

void main() {
  final datoCMSRepository = DatoCMSRepository();
  final encyclopediaService = EncyclopediaService(datoCMSRepository);

  final blocProviders = <BlocProvider>[
    BlocProvider<HomeBloc>(create: (BuildContext context) {
      return HomeBloc();
    }),
    BlocProvider<SaveBloc>(create: (BuildContext context) {
      return SaveBloc();
    }),
    BlocProvider<MapBloc>(create: (BuildContext context) {
      return MapBloc();
    }),
    BlocProvider<EncyclopediaBloc>(create: (BuildContext context) {
      return EncyclopediaBloc(encyclopediaService);
    }),
  ];

  runApp(App(blocs: blocProviders));
}
