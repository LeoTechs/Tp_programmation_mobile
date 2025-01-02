import 'package:flutter/material.dart';

// Créons la methode pour crer un coontainer d'image

Widget buildImageContainer(
    Color color, String title, String description, String imagePath) {
  return Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        )
      ],
    ),
  );
}
