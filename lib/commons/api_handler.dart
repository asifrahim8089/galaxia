import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:galaxia/models/search_result.dart'; // Import your model class

Future<SearchResult?> fetchSearchResult() async {
  final url = Uri.parse('http://test.lascade.com/api/test/list');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      var searchResult = SearchResult.fromJson(data);
      return searchResult;
    } else {
      // Handle error, e.g., throw an exception or return null
      return null;
    }
  } catch (e) {
    // Handle any exceptions that occurred during the HTTP request.
    print('Error: $e');
    return null;
  }
}
