import 'package:flutter/material.dart';
import 'package:sioquizz/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            LoginButton(
              text: 'Se connecter avec Google',
              icon: FontAwesomeIcons.google,
              color: Colors.blue,
              loginMethod: AuthService().googleLogin,
            ),
            /*  LoginButton(
              icon: FontAwesomeIcons.userNinja,
              text: "Continuer en tant qu'invité",
              loginMethod: AuthService().anonLogin,
              color: Colors.deepPurple,
            ), */
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 21,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(23),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
