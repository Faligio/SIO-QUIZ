import 'package:sioquizz/about/about.dart';
import 'package:sioquizz/profile/profile.dart';
import 'package:sioquizz/login/login.dart';
import 'package:sioquizz/topics/topics.dart';
import 'package:sioquizz/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
