import 'package:jogo_cultura_paraense/model/map_assets.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

class MapAssetsService {
  final DatoCMSRepository _repo = DatoCMSRepository();

  Future<MapAssets> fetchHomeAssets() async {
    try {
      final String query = '''
        query MyQuery {
          allMaps {
            info
            image {
              url
            }
          }
        }
      ''';
      dynamic result = await _repo.query(query, data: 'allMaps');
      return MapAssets.fromJson(result);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

}
