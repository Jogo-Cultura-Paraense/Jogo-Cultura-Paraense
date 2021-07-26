import 'package:jogo_cultura_paraense/model/map_assets.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

class MapAssetsService {
  final DatoCMSRepository _repo;
  const MapAssetsService(DatoCMSRepository repo) : _repo = repo;

  Future<MapAssets> fetchMapAssets(String region, int gamesOpen) async {
    final String query = '''
        query mapasset{
          mapasset(filter: {region: {eq: "$region"}, gamesOpen: {eq: "$gamesOpen"}}) {
            mapImage {
              url
            }
            region
            gamesOpen
          }
        }
      ''';
    dynamic result = await _repo.query(query, data: 'mapasset');
    return MapAssets.fromJson(result);
  }
}
