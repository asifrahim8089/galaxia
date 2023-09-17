import 'package:flutter/material.dart';
import 'package:galaxia/commons/api_handler.dart';
import 'package:galaxia/commons/colors.dart';
import 'package:galaxia/views/components/recommendedCard.dart';
import 'package:galaxia/views/components/shimmerCard.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _isLoading = true;
  var responsedata;

  @override
  void initState() {
    // Call the API handler function to fetch data
    fetchSearchResult().then((searchResult) {
      if (searchResult != null) {
        setState(() {
          responsedata = searchResult;
          _isLoading = false;
        });
      } else {
        // Handle the case where the API call fails
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBlackLight,
        elevation: 0,
        // leading: const Icon(
        //   Icons.arrow_back_ios,
        //   color: kWhiteColor,
        //   size: 15,
        // ),
        title: const Text(
          'Favorites', // Replace with your desired title
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? buildSearchResultCardShimmer(true)
          : ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemCount: responsedata.result.length,
              itemBuilder: (context, index) {
                final item = responsedata.result[index];
                return buildSearchResultCard(context, item, true);
              },
            ),
    );
  }
}
