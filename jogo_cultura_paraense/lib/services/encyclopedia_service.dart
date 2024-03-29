import 'package:jogo_cultura_paraense/model/encyclopedia_entry.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

class EncyclopediaService {
  final DatoCMSRepository _repo;
  const EncyclopediaService(DatoCMSRepository repo) : _repo = repo;

  Future<List<EncyclopediaEntry>> fetchEntries() async {
    final String query = '''
      query entryenc {
      allEntryencs(orderBy: [title_ASC], first: 100) {
        title
        body
        idEntry
      }
    }
    ''';
    final result = await _repo.query(query, data: 'allEntryencs');
    print(result.length);
    return EncyclopediaEntry.fromJsonList(result);
  }
}
