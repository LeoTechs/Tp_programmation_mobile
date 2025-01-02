import 'package:flutter/material.dart';
import 'package:smartchop/pages/ChatbotPage.dart';
import 'package:smartchop/pages/MealsPage.dart';
import 'package:smartchop/pages/ProfilePage.dart';
import 'package:smartchop/pages/StatisticsPage.dart';
import 'package:smartchop/pages/nav/drawerNavigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de Bord'),
      ),
      drawer: MainNavigationDrawer(), // Utilisation du drawer personnalisé
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Nombre de colonnes
          children: <Widget>[
            _buildCard(context, Icons.fastfood, 'Repas', () {
              // Navigation vers la page des repas

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MealsPage()),
              );
            }),
            _buildCard(context, Icons.bar_chart, 'Statistiques', () {
              // Navigation vers la page des statistiques

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsPage()),
              );
            }),
            _buildCard(context, Icons.person, 'Profil', () {
              // Navigation vers la page de profil

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }),
            _buildCard(context, Icons.chat, 'Chatbot', () {
              // Navigation vers la fonctionnalité de chatbot

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatbotPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
