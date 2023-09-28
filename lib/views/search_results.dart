// ignore_for_file: library_private_types_in_public_api, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:galaxia/commons/api_handler.dart';
import 'package:galaxia/views/components/recommendedCard.dart';
import 'package:galaxia/views/components/shimmerCard.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  bool _showSearchBar = true;
  bool _isLoading = true;
  var responsedata;
  final customScrollViewController = ScrollController();
  final listViewController = ScrollController();

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
      body: DefaultTabController(
        length: 4,
        child: CustomScrollView(
          controller: customScrollViewController,
          slivers: <Widget>[
            _showSearchBar
                ? SliverAppBar(
                    backgroundColor: HexColor("#2E3399"),
                    automaticallyImplyLeading: false,
                    expandedHeight: 100.0, // Adjust this as needed
                    floating: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        titlePadding: const EdgeInsets.all(0),
                        expandedTitleScale: 1.1,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16.0),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.sort,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Your search action here
                                    },
                                  ),
                                ),
                                hintText: "Planets",
                                hintStyle: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )),
                  )
                : SliverAppBar(
                    backgroundColor: HexColor("#2E3399"),
                    automaticallyImplyLeading: true,
                    expandedHeight: 0, // Adjust this as needed
                    floating: true,
                    pinned: true,
                    flexibleSpace: const FlexibleSpaceBar(
                      expandedTitleScale: 1.1,
                      title: Text(
                        'London', // Replace with your desired title
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                const TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: <Tab>[
                    Tab(text: 'Recommended'),
                    Tab(text: 'Price'),
                    Tab(text: 'Distance'),
                    Tab(text: 'Class'),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: <Widget>[
                  _isLoading
                      ? buildSearchResultCardShimmer(false)
                      : ListView.builder(
                          controller: listViewController,
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          itemCount: responsedata.result.length,
                          itemBuilder: (context, index) {
                            final item = responsedata!.result![index];
                            return buildSearchResultCard(context, item, false);
                          },
                        ),
                  const Center(child: Text('Tab 2 Content')),
                  const Center(child: Text('Tab 3 Content')),
                  const Center(child: Text('Tab 4 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initScrollListener();
  }

  void _initScrollListener() {
    // final scrollController = PrimaryScrollController.of(context);
    const threshold = 50.0; // Adjust this threshold as needed

    customScrollViewController.addListener(() {
      final pixels = customScrollViewController.position.pixels;
      final show = pixels < threshold;

      if (show != _showSearchBar) {
        setState(() {
          _showSearchBar = show;
        });
      }
    });

    listViewController.addListener(() {
      final pixels = listViewController.position.pixels;
      final show = pixels < threshold;

      if (show != _showSearchBar) {
        setState(() {
          _showSearchBar = show;
        });
      }
    });
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
