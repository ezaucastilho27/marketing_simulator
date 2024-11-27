import 'package:flutter/material.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de Empresas
    final List<Map<String, String>> empresas = [
      {
        'nome': 'Tech Solutions',
        'descricao': 'Empresa de tecnologia focada em softwares empresariais.',
        'setor': 'Tecnologia',
        'contato': 'contato@techsolutions.com',
      },
      {
        'nome': 'GreenLife Co.',
        'descricao': 'Startup de produtos sustentáveis e ecológicos.',
        'setor': 'Sustentabilidade',
        'contato': 'info@greenlife.com',
      },
      {
        'nome': 'FastFoodies',
        'descricao': 'Rede de fast food com foco em entregas rápidas.',
        'setor': 'Alimentação',
        'contato': 'delivery@fastfoodies.com',
      },
      {
        'nome': 'FitWear',
        'descricao': 'Marca de roupas esportivas com alcance internacional.',
        'setor': 'Moda e Esportes',
        'contato': 'sales@fitwear.com',
      },
      {
        'nome': 'Urban Architects',
        'descricao':
            'Escritório de arquitetura especializada em projetos urbanos.',
        'setor': 'Arquitetura',
        'contato': 'design@urbanarchitects.com',
      },
    ];

    // Lista de Influencers
    final List<Map<String, String>> influencers = [
      {
        'nome': 'Lara Fitness',
        'descricao':
            'Personal trainer e influenciadora digital no nicho fitness.',
        'seguidores': '1.2M',
        'contato': 'lara.fit@gmail.com',
      },
      {
        'nome': 'Tech Guru',
        'descricao': 'Criador de conteúdo sobre gadgets e tecnologia.',
        'seguidores': '850k',
        'contato': 'techguru@contenthub.com',
      },
      {
        'nome': 'Chef Ana Sabor',
        'descricao':
            'Influenciadora de culinária e especialista em receitas rápidas.',
        'seguidores': '500k',
        'contato': 'ana.sabor@foodiespace.com',
      },
      {
        'nome': 'Lucas Nomad',
        'descricao':
            'Viajante e criador de conteúdo sobre turismo sustentável.',
        'seguidores': '300k',
        'contato': 'lucas.nomad@travelblog.com',
      },
      {
        'nome': 'Maria Makeup',
        'descricao': 'Maquiadora profissional e influenciadora de beleza.',
        'seguidores': '1.5M',
        'contato': 'maria.makeup@beautyhub.com',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Empresas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...empresas
                .map((empresa) => _buildClienteCard(context, empresa))
                .toList(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Influencers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...influencers
                .map((influencer) => _buildClienteCard(context, influencer))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildClienteCard(BuildContext context, Map<String, String> cliente) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          cliente['nome'] ?? 'Nome não informado',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(cliente['descricao'] ?? 'Descrição não disponível'),
        trailing: cliente.containsKey('seguidores')
            ? Text('${cliente['seguidores']} seguidores')
            : Text(cliente['setor'] ?? ''),
        onTap: () {
          // Exibe os detalhes do cliente ao tocar
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(cliente['nome'] ?? 'Nome não informado'),
              content: Text(
                cliente.containsKey('seguidores')
                    ? 'Descrição: ${cliente['descricao']}\n\n'
                        'Seguidores: ${cliente['seguidores']}\n'
                        'Contato: ${cliente['contato']}'
                    : 'Descrição: ${cliente['descricao']}\n\n'
                        'Setor: ${cliente['setor']}\n'
                        'Contato: ${cliente['contato']}',
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
  }
}
