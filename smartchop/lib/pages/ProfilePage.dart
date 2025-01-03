import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartchop/model/userProfile.dart';

class ProfilePage extends StatelessWidget {
  final String userId;

  ProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Utilisateur'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('users').doc(userId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Utilisateur non trouvé'));
          }

          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final userProfile = UserProfile.fromMap(userData, snapshot.data!.id);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userProfile.imageUrl),
                ),
                SizedBox(height: 16),
                Text(
                  'Nom: ${userProfile.name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Email: ${userProfile.email}'),
                SizedBox(height: 8),
                Text('Téléphone: ${userProfile.phone}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
