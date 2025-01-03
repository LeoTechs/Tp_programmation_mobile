import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartchop/model/Meal.dart';

// je veux creer une fonction qui utilise ScaffoldMessenger pour afficher un message
void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

void showDeleteDialog(BuildContext context, String mealId) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Supprimer le repas'),
        content: Text('Êtes-vous sûr de vouloir supprimer ce repas ?'),
        actions: [
          TextButton(
            onPressed: () {
              //supprimer le repas dans Firestore
              FirebaseFirestore.instance
                  .collection('meals')
                  .doc(mealId)
                  .delete();
              Navigator.of(context).pop();
            },
            child: Text('Supprimer'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Annuler'),
          ),
        ],
      );
    },
  );
}

void showUpdateDialog(BuildContext context, Meal meal, String userId) {
  final nameController = TextEditingController(text: meal.name);
  final caloriesController =
      TextEditingController(text: meal.calories.toString());

  final descriptionController = TextEditingController(text: meal.description);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Mettre à jour le repas'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nom')),
            TextField(
                controller: caloriesController,
                decoration: InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                keyboardType: TextInputType.text),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final updatedMeal = Meal(
                id: meal.id,
                name: nameController.text,
                calories: int.parse(caloriesController.text),
                imageUrl: meal.imageUrl,
                creationDate: meal.creationDate,
                description: meal.description,
                userId: userId,
              );
              updateMeal(meal.id, updatedMeal); // Fermer la boîte de dialogue
            },
            child: Text('Mettre à jour'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Annuler'),
          ),
        ],
      );
    },
  );
}

Future<void> updateMeal(String mealId, Meal updatedMeal) async {
  await FirebaseFirestore.instance
      .collection('meals')
      .doc(mealId)
      .update(updatedMeal.toMap());
}
