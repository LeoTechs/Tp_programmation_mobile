import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartchop/global/notifier.dart';
import 'package:smartchop/model/Meal.dart';
import 'package:smartchop/pages/MealDetailPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Repas'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('meals')
            .where('userId', isEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }

          final meals = snapshot.data!.docs.map((doc) {
            return Meal.fromMap(doc.data() as Map<String, dynamic>, doc.id);
          }).toList();

          if (meals.isEmpty) {
            return Center(child: Text('La liste des repas est vide.'));
          }

          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealDetailPage(
                            meal: meal), // Assurez-vous d'avoir cette page
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.network(
                          meal.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text('Calories: ${meal.calories}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Text('Date de Création: ${meal.creationDate}'),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Supprimer le repas
                            showDeleteDialog(context, meal.id);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Mettre à jour le repas
                            if (userId != null) {
                              showUpdateDialog(context, meal, userId!);
                            } else {
                              // Handle the case where userId is null
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('User ID is null')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pushNamed(context, '/add-meal');
        },
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Ajouter un repas',
      ),
    );
  }
}
