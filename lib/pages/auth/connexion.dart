import 'package:flutter/material.dart';
import 'package:pharmacie/utils/background.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  _Connexion createState() => _Connexion();
}

class _Connexion extends State<Connexion> {
  final mailController = TextEditingController();
  final mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "CONNEXION",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 30),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: size.height * 0.00003),
// Pour le mail
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: mailController,
                autofocus: false,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Entrez SVP votre mail!!!");
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Entrer un mail valide!!!");
                  }
                  return null;
                },
                onSaved: (value) {
                  mailController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
// Pour le mot de passe
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: mdpController,
                autofocus: false,
                obscureText: true,
                validator: (value) {
                  RegExp regle = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Mot de passe obligatoire pour se connecter!!!");
                  }
                  if (!regle.hasMatch(value)) {
                    return ("Mot de passe doit être superieur à 6 caractères!!!");
                  }
                },
                onSaved: (value) {
                  mdpController.text = value!;
                },
                // textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.vpn_key),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.000005),
// Boutton Login
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width - 10, vertical: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.7,
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
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.000005),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width - 10, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Connexion()))
                },
                child: const Text(
                  "Inscription",
                  style: TextStyle(
                      fontSize: 15,
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
