import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gifapp/models/gif.dart';


class GiphyApi {
  static const _apiKey = 'uLt8LCJcmljAmZ8cgSQPOTNUuQ8IyUGV';
  static const _baseUrl = 'https://api.giphy.com/v1/gifs/search';

  Future<List<Gif>> searchGifs(String query, {int offset = 0}) async {
    final url = Uri.parse('$_baseUrl?api_key=$_apiKey&q=$query&limit=25&offset=$offset&rating=g&lang=en');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List data = body['data'];
      return data.map((e) => Gif.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load GIFs');
    }
  }
}
