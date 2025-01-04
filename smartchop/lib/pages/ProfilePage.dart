import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String? ResultatIMC;
  String? Interpretation;

  // Fonction pour calculer l'IMC

  void calculerIMC() {
    double poids = double.tryParse(weightController.text) ?? 0;
    double taille = double.tryParse(heightController.text) ?? 0;

    if (poids > 0 && taille > 0) {
      double imc =
          poids / ((taille / 100) * (taille / 100)); // hauteur en mètres
      setState(() {
        ResultatIMC = imc.toStringAsFixed(2); // Arrondir à deux décimales
        Interpretation = interpretBMI(imc);
      });
    } else {
      setState(() {
        ResultatIMC = "Veuillez entrer des valeurs valides.";
        Interpretation = null;
      });
    }
  }

  // Fonction pour interpréter l'IMC
  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return "Vous êtes en Sous-poids";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Vous êtes en Poids normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Vous êtes en Surpoids";
    } else {
      return "Vous êtes dans l' Obésité";
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: user != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: user.photoURL != null
                        ? NetworkImage(user.photoURL!)
                        : null,
                    child: user.photoURL == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                  SizedBox(height: 20),
                  Text("Nom : ${user.displayName ?? 'Non défini'}",
                      style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Email : ${user.email}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),

                  // Champs pour le poids et la taille
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(labelText: "Poids (kg)"),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: heightController,
                    decoration: InputDecoration(labelText: "Taille (cm)"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    //designer le bouton
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: calculerIMC,
                    child: Text("Calculer l'IMC"),
                  ),
                  SizedBox(height: 20),
                  // Afficher le résultat de l'IMC et son interprétation
                  if (ResultatIMC != null)
                    Column(
                      children: [
                        Text(
                          "Votre IMC est : $ResultatIMC",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Interprétation : $Interpretation",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ],
              ),
            )
          : Center(
              child: Text("Aucun utilisateur connecté."),
            ),
    );
  }
}
