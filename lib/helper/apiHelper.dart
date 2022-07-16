import 'package:dio/dio.dart';
import 'package:hydro_app/model/feeds.dart';
import 'package:hydro_app/model/writeButtonFeeds.dart';
import 'package:hydro_app/model/writeFeeds.dart';



class ApiService {
  ApiService._();
  static ApiService apiService=  ApiService._();
  final Dio _dio = Dio();

  final String baseUrl = 'https://api.thingspeak.com/';
  final String pathReadApi = 'channels/1655919/feeds.json';
  final String pathWriteApi = 'update';
  final String apiKeyWrite = 'api_key=8A9G0QZH5GHOAS1B';
  final String apiKeyWriteButton = 'api_key=AQHGNEJBPDWR2SPP';

  Future<List<Feeds>> getFeeds() async {
    try {
      final url = '$baseUrl$pathReadApi';
      final response = await _dio.get(url);
      var movies = response.data['feeds'] as List;
      List<Feeds> feedsList = movies.map((m) => Feeds.fromJson(m)).toList();
      return feedsList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  writeData(String temp,String himidity)async{
    String url = '$baseUrl$pathWriteApi?$apiKeyWrite';
    Response response = await Dio().post(url, data: WriteFeeds(
      field1: temp,
      field2: himidity
    ).toJson());

  }

  writeButtons(String fan1,fan2,pump,light)async{
    String url = '$baseUrl$pathWriteApi?$apiKeyWriteButton';
    Response response = await Dio().post(url, data: WriteButtonFeeds(
      field1: fan1,
      field2: fan2,
      field3: pump,
      field4: light,
    ).toJson());
  }



}