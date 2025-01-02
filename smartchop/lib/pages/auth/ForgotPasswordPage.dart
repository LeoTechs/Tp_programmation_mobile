import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Page de réinitialisation du mot de passe
// Cette page permet à l'utilisateur de réinitialiser son mot de passe en entrant son adresse email
// Et Un email de réinitialisation lui sera envoyé

class Forgotpasswordpage extends StatefulWidget {
  @override
  _ForgotpasswordpageState createState() => _ForgotpasswordpageState();
}

class _ForgotpasswordpageState extends State<Forgotpasswordpage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    Fluttertoast.showToast(msg: 'Entrez votre email svp');
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isSubmitting
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        foregroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: const Color.fromARGB(255, 170, 6, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          setState(() {
                            _isSubmitting = true;
                          });
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: _emailController.text);
                            Fluttertoast.showToast(
                                msg:
                                    'Mail de réinitialisation du mot de passe envoyé. Veuillez vérifier votre boîte de réception');
                          } catch (e) {
                            Fluttertoast.showToast(msg: e.toString());
                          }
                          setState(() {
                            _isSubmitting = false;
                          });
                        }
                      },
                      child: Text('Envoyer le mail de réinitialisation'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
