import 'package:flutter/material.dart';
import 'screens/campanhas.dart';
import 'screens/clientes.dart';
import 'screens/analises.dart';
import 'screens/configuracoes.dart';
import 'screens/home.dart';
import 'screens/login.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/campanhas': (context) => const CampanhasScreen(),
  '/clientes': (context) => const ClientesScreen(),
  '/analises': (context) => const AnalisesScreen(),
  '/configuracoes': (context) => const ConfiguracoesScreen(),
};
