// ignore_for_file: library_private_types_in_public_api

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:galaxia/commons/colors.dart';
import 'package:galaxia/views/chat_screen.dart';
import 'package:galaxia/views/favorites.dart';
import 'package:galaxia/views/home_screen.dart';
import 'package:galaxia/views/reports_screen.dart';

class BottomNavigation extends StatefulWidget {
  final index;
  const BottomNavigation({Key? key, this.index}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      setState(() {
        _currentIndex = widget.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kBlackLight,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          ReportScreen(),
          FavoritesScreen(),
          ChatScreen(),
        ],
      ),
      bottomNavigationBar: DotNavigationBar(
        paddingR: const EdgeInsets.all(15),
        borderRadius: 20,
        marginR: const EdgeInsets.all(12),
        backgroundColor: kBlackColor,
        selectedItemColor: kWhiteColor,
        unselectedItemColor: kGreyLight,
        currentIndex: _currentIndex,
        onTap: onTappedBar,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.graphic_eq),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.favorite_rounded),
          ),
          DotNavigationBarItem(
            icon: const Icon(Icons.messenger_sharp),
          ),
        ],
      ),
    );
  }
}
