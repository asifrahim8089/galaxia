import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:galaxia/models/search_result.dart';

Future<SearchResult?> fetchSearchResult() async {
  final url = Uri.parse('http://test.lascade.com/api/test/list');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      var searchResult = SearchResult.fromJson(data);

      if (searchResult.result != null) {
        final imageFutures = searchResult.result!.map((result) async {
          final imageUrl = result.imageUrl;
          if (imageUrl != null && Uri.parse(imageUrl).isAbsolute) {
            final imageResponse = await http.get(Uri.parse(imageUrl));
            if (imageResponse.statusCode == 200) {
            } else {
              print(
                  'Image HTTP request failed, statusCode: ${imageResponse.statusCode}, $imageUrl');
              result.imageUrl = 'assets/images/banner1.png';
            }
          } else {
            print('Invalid image URL: $imageUrl');
            result.imageUrl = 'assets/images/banner1.png';
          }
        });

        await Future.wait(imageFutures);
      }

      return searchResult;
    } else {
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
