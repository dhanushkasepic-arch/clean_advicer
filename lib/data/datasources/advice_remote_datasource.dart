import 'dart:convert';
import 'package:http/http.dart' as http;
import '../exceptions/exceptions.dart';
import '../models/advice_model.dart';

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {

  final http.Client client;
  AdviceRemoteDatasourceImpl({required this.client });


  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    try {
      final response = await client.get(
        Uri.parse('https://api.adviceslip.com/advice'),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return AdviceModel.fromJson(responseBody);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}