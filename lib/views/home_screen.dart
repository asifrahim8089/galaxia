import 'package:flutter/material.dart';
import 'package:galaxia/commons/colors.dart';
import 'package:galaxia/commons/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:galaxia/models/home_category.dart';
import 'package:galaxia/views/search_results.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _images = [
    Image.asset('assets/images/banner1.png'), // Replace with your image URLs
    Image.asset('assets/images/banner1.png'),
    Image.asset('assets/images/banner1.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackLight,
      appBar: AppBar(
        backgroundColor: kBlackLight,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Stack(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: kBlueColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Image.asset(
                  'assets/icons/Galaxia.png',
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 200,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/icons/faris DP2.png',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: kGreyLight,
                  ),
                  suffixIcon: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CircleAvatar(
                      backgroundColor: kBlueColor,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: kWhiteColor,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchResults()));
                        },
                      ),
                    ),
                  ),
                  hintText: "Search your destination",
                  hintStyle: kText12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  CarouselSlider(
                    items: _images.map((image) {
                      return FractionallySizedBox(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child:
                              image, // Assuming _images contains Image widgets or similar.
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _images.map((image) {
                        int index = _images.indexOf(image);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: kWhiteColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Galaxies",
                      style: kText165,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                            child: Card(
                              color: Colors.grey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  data[index]['image'],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            data[index]['label'],
                            style: kText125,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
