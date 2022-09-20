import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:modern_bottom_nav_bar/page/Favorite.dart';
import 'package:modern_bottom_nav_bar/page/search.dart';
import 'package:modern_bottom_nav_bar/page/settings.dart';
import 'package:modern_bottom_nav_bar/page/user_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

   void userSelected(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    UserHome(),
    Favorite(),
    Search(),
    Settings()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: GNav(
            onTabChange: userSelected,
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 8,
            iconSize: 30,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon:Icons.home,
                  text: 'Home'),
              GButton(icon: Icons.favorite,
                  text: 'Likes'),
              GButton(icon: Icons.search,
                  text: 'Search'),
              GButton(icon: Icons.settings,
                  text: 'Settings')
            ],
          ),
        ),
      )
    );
  }
}
