import 'package:jogo_cultura_paraense/model/home_assets.dart';

enum TimePeriod { morning, afternoon, night }

class HomeAssetsService {
  Future<HomeAssets> getBackgroundImage() async {
    try {
      await Future.delayed(Duration(seconds: 4));
      TimePeriod period = checkTime();
      if (period == TimePeriod.morning) {
        return HomeAssets.fromJson(
          {
            'background': 'lib/images/MorningBackground.png',
            'info':
                'Está de manhã! Durante essa hora do dia, todos os dias ocorrem chuvas torrenciais em Belém do Pará, principalmente entre os meses de Janeiro e Maio.'
          },
        );
      } else if (period == TimePeriod.afternoon) {
        return HomeAssets.fromJson(
          {
            'background': 'lib/images/EveningBackground.png',
            'info':
                'Está de tarde! Durante essa hora do dia, todos os dias ocorrem chuvas torrenciais em Belém do Pará, principalmente entre os meses de Janeiro e Maio.'
          },
        );
      } else
        return HomeAssets.fromJson(
          {
            'background': 'lib/images/NightBackground.png',
            'info':
                'Está de noite! Durante essa hora do dia, todos os dias ocorrem chuvas torrenciais em Belém do Pará, principalmente entre os meses de Janeiro e Maio.'
          },
        );
    } catch (error) {
      throw Exception(error.toString);
    }
  }

  TimePeriod checkTime() {
    DateTime now = new DateTime.now();
    TimePeriod period;
    if (now.hour >= 6 && now.hour <= 12) {
      period = TimePeriod.morning;
    } else if (now.hour >= 12 && now.hour <= 18) {
      period = TimePeriod.afternoon;
    } else {
      period = TimePeriod.night;
    }
    return period;
  }
}
