import 'dart:convert';
import 'dart:developer';
//import 'dart:html';
import 'package:http/http.dart' as http;

import '../prediction_model.dart';

class ApiService {
  Future<predictionModel?> getImg(String path) async {
    try {
      final file = File(path);
      var url = Uri.parse('http://52.86.193.151:8000/clasify');
      var response = await http.post(url, body: file);

      if (response.statusCode == 200) {

        predictionModel _model = serviceModelFromJson(response.body);
        print('Este es la predicción $_model');
        return _model;
      }
    } catch (e) {
      log("ERROR" + e.toString());
    }
  }
}