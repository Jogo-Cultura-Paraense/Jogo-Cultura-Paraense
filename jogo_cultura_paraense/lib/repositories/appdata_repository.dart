import 'dart:convert';
import 'dart:io';
import 'package:jogo_cultura_paraense/model/save.dart';
import 'package:path_provider/path_provider.dart';

class AppDataRepository {
  Future<File> _getFile(int id) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(directory.path + '/save$id.json');
    if (await file.exists() == false) {
      return _createSave(file, id);
    }
    return file;
  }

  Future<File> _createSave(File file, int id) async {
    file = await file.create();
    file.writeAsString(json.encode(Save.initial(Saves.saves[id])));
    return file;
  }

  Future<void> updateSave(int id, Save save) async {
    final file = await _getFile(id);
    file.writeAsString(json.encode(save.toJson()));
  }

  Future<String> getSave(int id) async {
    final file = await _getFile(id);
    final String save = await file.readAsString();
    return save;
  }
}
