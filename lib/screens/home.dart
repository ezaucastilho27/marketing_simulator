import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 90, // Define a altura da logo
          child: Image.asset(
            'assets/images/login_logo.png', // Substitua pelo caminho correto da sua logo
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: const Color(0xFF215A6D), // Exemplo de cor da AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.white,
            tooltip: 'Configurações',
            onPressed: () {
              Navigator.pushNamed(context, '/configuracoes');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Gerenciador de Marketing',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D29), // Cor dos títulos
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // Número de colunas (2 para "Análises" e "Clientes")
                childAspectRatio: 1, // Formato quadrado
                crossAxisSpacing: 16.0, // Espaçamento horizontal entre os itens
                mainAxisSpacing: 16.0, // Espaçamento vertical entre os itens
              ),
              children: [
                _buildMenuItem(
                    context, 'Análises', Icons.bar_chart, '/analises'),
                _buildMenuItem(context, 'Clientes', Icons.people, '/clientes'),
                // Campanhas abaixo, centralizado com o grid de 2 colunas
                _buildMenuItem(
                    context, 'Campanhas', Icons.campaign, '/campanhas'),
              ],
            ),
          ),
          const SizedBox(height: 16), // Espaço entre a grade e o texto
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Transforme dados em decisões\nSeu laboratório de estratégias de marketing',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D2D29), // Cor dos textos
              ),
            ),
          ),
          const SizedBox(height: 12), // Espaço entre o texto e o botão
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Ação para o botão "Fale Conosco"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF215A6D), // Cor do botão
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Fale Conosco',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, String route) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Bordas arredondadas
      ),
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 40, color: const Color(0xFF215A6D)), // Ícone do item
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000), // Cor do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
