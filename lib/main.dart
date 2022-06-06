import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sioquizz/routes.dart';
import 'package:sioquizz/services/services.dart';
import 'package:sioquizz/shared/shared.dart';
import 'package:sioquizz/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialise FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check les erreurs
        if (snapshot.hasError) {
          // On affiche un ecran d'erreur
        }

        // On affiche l'application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
            create: (_) => FirestoreService().streamReport(),
            catchError: (_, err) => Report(),
            initialData: Report(),
            child: MaterialApp(
                debugShowCheckedModeBanner: true,
                routes: appRoutes,
                theme: appTheme),
          );
        }

        // On affiche autre chose en attendant que l'initialisation soit terminé (pour les telephones plus vieux)
        return const MaterialApp(home: LoadingScreen());
      },
    );
  }
}
