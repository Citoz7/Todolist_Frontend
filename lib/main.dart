import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'setting.dart';
import 'buataktivitas.dart';
import 'catatan.dart';
import 'buatcatatan.dart';
import 'editcatatan.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PRODUKTIF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF212121),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF212121),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/setting': (context) => const Setting(),
        '/buataktivitas': (context) => const BuatAktivitas(),
        '/catatan': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return Catatan(catatan: args['catatan']);
        },
        '/buatcatatan': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>?;

          return Note(
            id: args?['id'],
            judul: args?['judul'],
            teks: args?['teks'],
          );
        },
        '/editcatatan': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return EditNote(catatan: args['catatan']);
        },
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
