import 'dart:convert';
import 'package:assignments/helpers/api.dart';
import 'package:assignments/helpers/api_url.dart';
import 'package:assignments/model/tugas.dart';

class TugasBloc {
  static Future<List<Tugas>> getTugas() async {
  String apiUrl = ApiUrl.listTugas;
  var response = await Api().get(apiUrl);
  var jsonObj = json.decode(response.body);

  if (jsonObj != null && jsonObj['data'] != null) {
    List<dynamic> listTugas = jsonObj['data'];
    List<Tugas> tugasList = [];
    for (int i = 0; i < listTugas.length; i++) {
      tugasList.add(Tugas.fromJson(listTugas[i]));
    }
    return tugasList;
  } else {
    // Handle the case where 'data' is null or not present in the response.
    return [];
  }
}


  static Future<bool> addTugas({Tugas? tugas}) async {
    String apiUrl = ApiUrl.createTugas;
    var body = {
      "title": tugas!.title,
      "description": tugas.description,
      "deadline": tugas.deadline?.toIso8601String(),
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateTugas({required Tugas tugas}) async {
    String apiUrl = ApiUrl.updateTugas(tugas.id!);
    var body = {
      "title": tugas.title,
      "description": tugas.description,
      "deadline": tugas.deadline?.toIso8601String(),
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> deleteTugas(int? id) async {
    String apiUrl = ApiUrl.deleteTugas(id!);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['status'];
  }
}
