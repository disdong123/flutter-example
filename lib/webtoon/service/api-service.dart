import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";

  static Future<List<WebtoonResponse>> getTodayWebtoons() async {
    final response = await http.get(Uri.parse('$baseUrl/today'));
    if(response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      return webtoons.map((element) {
        return WebtoonResponse.fromJson(element);
      }).toList();
    } else {
      throw Exception('Failed to load webtoons');
    }
  }

  static Future<int> getSomething(id) {
    return Future.value(1);
  }
}

class WebtoonResponse {
  final String title, thumb, id;

  WebtoonResponse.fromJson(Map<String, dynamic> json) :
    title = json['title'],
    thumb = json['thumb'],
    id = json['id'];
}