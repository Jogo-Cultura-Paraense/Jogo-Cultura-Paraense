import 'package:jogo_cultura_paraense/model/map_assets.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

class MapAssetsService {
  final DatoCMSRepository _repo = DatoCMSRepository();

  Future<MapAssets> fetchMapAssets(String region, int gamesOpen) async {
    try {
      final String query = '''
        query mapasset{
          mapasset(filter: {region: {eq: "$region"}, gamesOpen: {eq: "$gamesOpen"}}) {
            mapImage {
              url
            }
            region
          }
        }
      ''';
      dynamic result = await _repo.query(query, data: 'mapasset');
      return MapAssets.fromJson(result);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
