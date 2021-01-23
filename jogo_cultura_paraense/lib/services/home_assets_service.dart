import 'package:jogo_cultura_paraense/model/home_assets.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

class HomeAssetsService {
  final DatoCMSRepository _repo = DatoCMSRepository();

  Future<HomeAssets> fetchHomeAssets() async {
    try {
      String time = checkTime();
      final String query = '''
        query homeasset{
          homeasset {
            ${time}Bg {
              url
            }
            ${time}Info
          }
        }
      ''';
      dynamic result = await _repo.query(query);
      return HomeAssets.fromJson(time, result);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  String checkTime() {
    DateTime now = new DateTime.now();
    if (now.hour >= 6 && now.hour <= 12) {
      return 'mourning';
    } else if (now.hour >= 12 && now.hour <= 18) {
      return 'evening';
    } else {
      return 'night';
    }
  }
}
