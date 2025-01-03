import 'package:flutter/material.dart';
import 'package:smartchop/pages/ChatbotPage.dart';
import 'package:smartchop/pages/MealsPage.dart';
import 'package:smartchop/pages/ProfilePage.dart';
import 'package:smartchop/pages/StatisticsPage.dart';
import 'package:smartchop/pages/homePage.dart';

class MainBottomNavigationBar extends StatefulWidget {
  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _selectedIndex = 0;

  // Liste des pages
  final List<Widget> _pages = [
    HomePage(),
    MealsPage(),
    StatisticsPage(),
    ProfilePage(
      userId: '',
    ),
    ChatbotPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Affiche la page sélectionnée
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Repas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Statistiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
