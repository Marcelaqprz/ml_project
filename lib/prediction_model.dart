import 'dart:convert';
predictionModel serviceModelFromJson(String str) => predictionModel.fromJson(json.decode(str));

String serviceModelToJson(predictionModel data) => json.encode(data.toJson());

class predictionModel {
  String prediction;

  predictionModel({
    required this.prediction,
  });



  factory predictionModel.fromJson(Map<String, dynamic> json) => predictionModel(
    prediction: json["prediction"],
  );

  Map<String, dynamic> toJson() => {
    "prediction": prediction,
  };
}