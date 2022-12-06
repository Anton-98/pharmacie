import 'package:flutter/material.dart';
import 'package:pharmacie/pages/auth/connexion.dart';
import 'package:pharmacie/utils/background.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  _Inscription createState() => _Inscription();
}

class _Inscription extends State<Inscription> {
  // final _formKey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  String? msgErreur;

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final mdpController = TextEditingController();
  final mdpConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "REGISTER",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // Pour le nom
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  autofocus: false,
                  controller: nomController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regle = RegExp(r'^.{2,}$');
                    if (value!.isEmpty) {
                      return ("Le nom ne doit pas être vide.");
                    }
                    if (!regle.hasMatch(value)) {
                      return ("Le nom doit-être au moins 2 caratères.");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nomController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Nom",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            SizedBox(height: size.height * 0.03),
            // Pour le prénom
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  autofocus: false,
                  controller: prenomController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regle = RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("Le prénom ne doit pas être vide.");
                    }
                    if (!regle.hasMatch(value)) {
                      return ("Le prénom doit-être au moins 3 caratères.");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    prenomController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Prénom",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            SizedBox(height: size.height * 0.03),
            // Pour le email
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  autofocus: false,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Entrer SVP uvotre email.");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Entrer SVP un mail valide.");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            SizedBox(height: size.height * 0.03),
            // Pour le mot de passe
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  controller: mdpController,
                  validator: (value) {
                    RegExp regle = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("Mot de passe obligatoire!!!");
                    }
                    if (!regle.hasMatch(value)) {
                      return ("Entrer un mot de passe valide :(Min. 6 Caractères)");
                    }
                  },
                  onSaved: (value) {
                    mdpController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            SizedBox(height: size.height * 0.05),
            // Pour la confirmation du mot de passe
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  autofocus: false,
                  controller: mdpConfirmController,
                  obscureText: true,
                  validator: (value) {
                    if (mdpController.text != mdpConfirmController.text) {
                      return "Mot de passe de confirmation incorrect.";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mdpConfirmController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.vpn_key),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Confirmation mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  //inscrire(emailController.text, mdpController.text);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: const LinearGradient(colors: [
                        Colors.lightBlueAccent,
                        Colors.lightBlue,
                        Colors.blueAccent,
                        Colors.blueAccent
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Connexion()))
                },
                child: const Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
