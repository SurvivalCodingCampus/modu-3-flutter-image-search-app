import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app/data/data_source/photo_data_source.dart';
import 'package:image_search_app/data/dto/photo_result_dto.dart';

class PixabayApi implements PhotoDataSource {
  static const String baseUrl =
      'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&image_type=photo';

  final http.Client _client;

  PixabayApi({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<PhotoResultDto> getPhotoResultDtoById(int id) async {
    final response = await _client.get(Uri.parse('$baseUrl&id=$id'));
    return PhotoResultDto.fromJson(jsonDecode(response.body));
  }

  @override
  Future<PhotoResultDto> getPhotoResultDtoByQuery(String query) async {
    final response = await _client.get(Uri.parse('$baseUrl&q=$query'));
    return PhotoResultDto.fromJson(jsonDecode(response.body));
  }
}
