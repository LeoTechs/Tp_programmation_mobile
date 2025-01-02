import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Cette page a pour but de créer un menu de navigation latéral
//Qui permettra à l'utilisateur de naviguer entre les différentes pages de l'application

class MainNavigationDrawer extends StatelessWidget {
  // Récupérer l'utilisateur dans firestore

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            accountName: Text('John Doe'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('JD'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.red),
            title: Text('Accueil'),
            onTap: () {
              // Navigate to the home page
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.red),
            title: Text('Profil'),
            onTap: () {
              // Naviguer vers la page de profil
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant, color: Colors.red),
            title: Text('Mes Repas'),
            onTap: () {
              // Naviguer vers la page des repas
              Navigator.pushNamed(context, '/meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics, color: Colors.red),
            title: Text('Statistiques'),
            onTap: () {
              // Naviguer vers la page des statistiques
              Navigator.pushNamed(context, '/statistics');
            },
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu, color: Colors.red),
            title: Text('Recommandations'),
            onTap: () {
              // Naviguer vers la page des recommandations
              Navigator.pushNamed(context, '/recommendations');
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.red),
            title: Text('Mes Restaurants'),
            onTap: () {
              // Naviguer vers la page des restaurants des restaurants proposés
              Navigator.pushNamed(context, '/restaurants');
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.red),
            title: Text('Chatbot'),
            onTap: () {
              // Navigate to the chatbot page
              Navigator.pushNamed(context, '/chatbot');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Déconnexion'),
            onTap: () {
              // Log out the user
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
