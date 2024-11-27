import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == 'flutter@gmail.com' && password == '123456') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciais inválidas!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFECE6), // Cor de fundo (todas as telas)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Adicionando a imagem acima do título
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/login_logo.png', // Caminho da imagem
                height: 120.0, // Tamanho da imagem
              ),
            ),
            const SizedBox(height: 16), // Espaço entre a imagem e o título
            const Text(
              'Bem-vindo ao Gerenciador de Marketing',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D29), // Cor dos títulos
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle:
                    const TextStyle(color: Color(0xFF3CA2A2)), // Cor dos textos
                fillColor: const Color(0xFF92C7A3), // Cor de fundo dos widgets
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: const Color(0xFF215A6D)), // Cor do seletor
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle:
                    const TextStyle(color: Color(0xFF3CA2A2)), // Cor dos textos
                fillColor: const Color(0xFF92C7A3), // Cor de fundo dos widgets
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: const Color(0xFF215A6D)), // Cor do seletor
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF215A6D), // Cor do botão
              ),
              child:
                  const Text('Entrar', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Ação para "Esqueceu sua senha?"
              },
              child: const Text(
                'Esqueceu sua senha? Clique aqui.',
                style: TextStyle(
                  color: Color(0xFF3CA2A2), // Cor do texto
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Ação para login com Facebook
                  },
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text('Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor do botão
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Ação para login com Google
                  },
                  icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                  label: const Text('Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Cor do botão
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
