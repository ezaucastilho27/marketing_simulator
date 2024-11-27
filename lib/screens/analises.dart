import 'package:flutter/material.dart';

class AnalisesScreen extends StatelessWidget {
  const AnalisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de Clientes
    final List<Map<String, String>> clientes = [
      {
        'nome': 'Tech Solutions',
        'tipo': 'Empresa',
        'imagem': 'assets/images/grafico_Tech_Solutions.png'
      },
      {
        'nome': 'GreenLife Co.',
        'tipo': 'Empresa',
        'imagem': 'assets/images/grafico_GreenLife.png'
      },
      {
        'nome': 'FastFoodies',
        'tipo': 'Empresa',
        'imagem': 'assets/images/grafico_FastFoodies.png'
      },
      {
        'nome': 'FitWear',
        'tipo': 'Empresa',
        'imagem': 'assets/images/grafico_FitWear.png'
      },
      {
        'nome': 'Urban Architects',
        'tipo': 'Empresa',
        'imagem': 'assets/images/grafico_UrbanArchitects.png'
      },
      {
        'nome': 'Lara Fitness',
        'tipo': 'Influencer',
        'imagem': 'assets/images/grafico_LaraFitness.png'
      },
      {
        'nome': 'Tech Guru',
        'tipo': 'Influencer',
        'imagem': 'assets/images/grafico_TechGuru.png'
      },
      {
        'nome': 'Chef Ana Sabor',
        'tipo': 'Influencer',
        'imagem': 'assets/images/grafico_ChefAnaSabor.png'
      },
      {
        'nome': 'Lucas Nomad',
        'tipo': 'Influencer',
        'imagem': 'assets/images/grafico_LucasNomad.png'
      },
      {
        'nome': 'Maria Makeup',
        'tipo': 'Influencer',
        'imagem': 'assets/images/grafico_MariaMakeup.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Análises de Marketing'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              // Ajustando o Wrap para ter dois itens por linha
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0, // Espaçamento horizontal entre os itens
                runSpacing: 20.0, // Espaçamento vertical entre as linhas
                children: [
                  for (var cliente in clientes)
                    _buildGrafico(cliente['nome']!, cliente['tipo']!,
                        cliente['imagem']!, context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrafico(
      String nome, String tipo, String imagem, BuildContext context) {
    return Container(
      width: 170, // Largura consistente para manter alinhamento
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF215A6D), // Fundo do gráfico
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagem),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Gráfico de Resultados',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '$nome - $tipo',
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Este gráfico mostra o desempenho de marketing da $nome, com base nos resultados de campanhas publicitárias e engajamento.',
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
