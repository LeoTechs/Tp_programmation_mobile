import 'package:flutter/material.dart';

// Page d'accueil de connexion
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromARGB(255, 75, 5, 82), // Virgule correcte
                  const Color.fromARGB(255, 207, 3, 3), // Virgule correcte
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22.0),
              child: Text(
                "Smart Tchop\nConnexion !", // Pas de virgule nécessaire ici
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(48),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Email",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        suffixIcon: Icon(Icons.email, color: Colors.grey),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        label: Text(
                            "Mot de passe", // Pas de virgule nécessaire ici
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        suffixIcon:
                            Icon(Icons.visibility_off, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 75, 5, 82),
                            const Color.fromARGB(255, 207, 3, 3),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "CONNEXION",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Vous n'aves pas de compte ?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "S'inscrire ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
