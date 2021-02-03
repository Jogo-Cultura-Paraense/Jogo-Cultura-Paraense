import 'package:jogo_cultura_paraense/model/Eentry.dart';
import 'package:jogo_cultura_paraense/repositories/datocms_repository.dart';

class EnciclopediaServices {
  final DatoCMSRepository _dao = DatoCMSRepository();
  Future<List<ETopic>> fetchEntries() async {
    try {
      final String query = '''
       query entryenc {
        allEntryencs(filter: {OR: {isunlocked: {eq: "true"}}}) {
         title
        body
        }
        }

      ''';
      var result = await _dao.query(query, data: 'allEntryencs');
      //print(ETopic.fromJsonList(result));
      return ETopic.fromJsonList(result);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
