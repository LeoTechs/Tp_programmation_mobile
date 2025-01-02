import 'package:flutter/material.dart';

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
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
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
