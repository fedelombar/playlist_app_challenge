import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:playlist_app/models/content_card.dart';


class ApiService {
  Future<List<ContentCardItem>> fetchCardItems() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ContentCardItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
