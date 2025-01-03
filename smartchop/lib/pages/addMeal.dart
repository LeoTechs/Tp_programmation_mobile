import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartchop/global/notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smartchop/model/Meal.dart';

class AddMealPage extends StatefulWidget {
  @override
  _AddMealPageState createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  //recupere l'id de l'utilisateur connecté
  final user = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _imageUrl = '';
  int _calories = 0;
  String _creationDate = '';
  String _description = '';

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newMeal = Meal(
        id: '',
        name: _name,
        imageUrl: _imageUrl,
        calories: _calories,
        creationDate: _creationDate,
        description: _description,
        userId: user!.uid,
      );

      // Ajouter le repas à Firestore
      await FirebaseFirestore.instance.collection('meals').add({
        'name': newMeal.name,
        'imageUrl': newMeal.imageUrl,
        'calories': newMeal.calories,
        'creationDate': newMeal.creationDate,
        'description': newMeal.description,
        'userId': user!.uid,
      });

      Navigator.pop(context); // Ferme la page après l'ajout

      showMessage(context, 'Repas ajouté avec succès !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Repas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom du Repas'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nom.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL de l\'Image'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une URL.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _imageUrl = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer le nombre de calories.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _calories = int.parse(value!);
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Date de Création (JJ/MM/AAAA)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une date.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _creationDate = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Ajouter le Repas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
