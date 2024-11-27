import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const MarketingManagerApp());
}

class MarketingManagerApp extends StatelessWidget {
  const MarketingManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Marketing',
      theme: ThemeData(
        // Usando colorScheme para definir as cores principais
        colorScheme: const ColorScheme(
          brightness: Brightness.light, // Define o tema como claro (light)
          primary: Color(0xFF215A6D), // Cor do seletor
          secondary: Color(0xFF3CA2A2), // Cor dos textos (todos)
          surface: Color(0xff81b6bf), // Cor de fundo dos widgets
          background: Color(0xFFDFECE6), // Cor de fundo (todas as telas)
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ),

        scaffoldBackgroundColor: const Color(
            0xFFDFECE6), // Cor de fundo do Scaffold (todas as telas)

        textTheme: TextTheme(
          headline6: TextStyle(
            color: const Color(0xFF2D2D29), // Cor dos títulos (todos)
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: const Color(0xFF3CA2A2), // Cor dos textos (todos)
          ),
          bodyText2: TextStyle(
            color: const Color(0xFF3CA2A2), // Cor dos textos (todos)
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF92C7A3), // Cor de fundo dos widgets
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: const Color(0xFF215A6D)), // Cor do seletor
          ),
          labelStyle: TextStyle(
              color: const Color(0xFF3CA2A2)), // Cor dos textos nos campos
        ),

        buttonTheme: ButtonThemeData(
          buttonColor: const Color(0xFF215A6D), // Cor do botão
        ),
      ),
      initialRoute: '/login', // Define a tela de Login como inicial
      routes: appRoutes,
    );
  }
}
