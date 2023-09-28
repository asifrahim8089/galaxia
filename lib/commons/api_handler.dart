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

      // Check and handle image URLs
      if (searchResult.result != null) {
        for (var result in searchResult.result!) {
          final imageUrl = result.imageUrl;
          if (imageUrl != null && Uri.parse(imageUrl).isAbsolute) {
            final imageResponse = await http.get(Uri.parse(imageUrl));
            if (imageResponse.statusCode == 200) {
              // Image is accessible, you can proceed with the result
            } else {
              print(
                  'Image HTTP request failed, statusCode: ${imageResponse.statusCode}, $imageUrl');

              // Set a default image URL for this result
              result.imageUrl =
                  'assets/images/banner1.png'; // Replace with your default image URL
            }
          } else {
            print('Invalid image URL: $imageUrl');
            // Set a default image URL for this result
            result.imageUrl =
                'assets/images/banner1.png'; // Replace with your default image URL
          }
        }
      }

      // Return the modified searchResult
      return searchResult;
    } else {
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
