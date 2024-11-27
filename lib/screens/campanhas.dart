import 'package:flutter/material.dart';

class CampanhasScreen extends StatelessWidget {
  const CampanhasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de campanhas de marketing
    final List<Map<String, String>> campanhas = [
      {
        'nome': 'Lançamento do Produto X',
        'descricao': 'Campanha para apresentar o novo Produto X ao mercado.',
        'status': 'Ativa',
        'data': '01/11/2024',
      },
      {
        'nome': 'Black Friday 2024',
        'descricao': 'Promoções e descontos especiais para a Black Friday.',
        'status': 'Planejada',
        'data': '29/11/2024',
      },
      {
        'nome': 'Natal Solidário',
        'descricao':
            'Iniciativa para engajar o público com ações sociais no Natal.',
        'status': 'Concluída',
        'data': '25/12/2023',
      },
      {
        'nome': 'Verão com Estilo',
        'descricao': 'Promoção de roupas e acessórios para o verão.',
        'status': 'Ativa',
        'data': '10/01/2025',
      },
      {
        'nome': 'Semana do Cliente',
        'descricao':
            'Campanha especial com descontos para clientes fidelizados.',
        'status': 'Planejada',
        'data': '15/09/2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campanhas de Marketing'),
      ),
      body: ListView.builder(
        itemCount: campanhas.length,
        itemBuilder: (context, index) {
          final campanha = campanhas[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                campanha['nome']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(campanha['descricao']!),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    campanha['status']!,
                    style: TextStyle(
                      color: _getStatusColor(campanha['status']!),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Início: ${campanha['data']}'),
                ],
              ),
              onTap: () {
                // Exibe detalhes da campanha ao clicar
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(campanha['nome']!),
                    content: Text(
                      'Descrição: ${campanha['descricao']}\n\n'
                      'Status: ${campanha['status']}\n'
                      'Data de início: ${campanha['data']}',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Fechar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Retorna uma cor com base no status da campanha
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Ativa':
        return Colors.green;
      case 'Planejada':
        return Colors.orange;
      case 'Concluída':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}
