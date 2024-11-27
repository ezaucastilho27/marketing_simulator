import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatefulWidget {
  const ConfiguracoesScreen({super.key});

  @override
  State<ConfiguracoesScreen> createState() => _ConfiguracoesScreenState();
}

class _ConfiguracoesScreenState extends State<ConfiguracoesScreen> {
  bool _isDarkMode = false; // Variável para alternar o tema
  bool _notificationsEnabled = true; // Variável para notificações
  String _language = 'Português'; // Idioma padrão
  bool _shareDataUsage = false; // Compartilhamento de dados
  bool _twoFactorAuth = false; // Autenticação de 2 fatores

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configurações Padrão',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Configuração de Tema (Claro/escuro)
            ListTile(
              title: const Text('Tema'),
              trailing: Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                },
              ),
            ),
            const Divider(),

            // Configuração de Notificações
            ListTile(
              title: const Text('Notificações'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            const Divider(),

            // Configuração de Idioma
            ListTile(
              title: const Text('Idioma'),
              subtitle: Text(_language),
              onTap: () async {
                String? selectedLanguage = await showDialog<String>(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Escolha o Idioma'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Português');
                          },
                          child: const Text('Português'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'English');
                          },
                          child: const Text('English'),
                        ),
                      ],
                    );
                  },
                );

                if (selectedLanguage != null) {
                  setState(() {
                    _language = selectedLanguage;
                  });
                }
              },
            ),
            const Divider(),

            // Configuração de Privacidade - Compartilhar Dados de Uso
            ListTile(
              title: const Text('Compartilhar Dados de Uso'),
              trailing: Switch(
                value: _shareDataUsage,
                onChanged: (value) {
                  setState(() {
                    _shareDataUsage = value;
                  });
                },
              ),
            ),
            const Divider(),

            // Configuração de Privacidade - Autenticação de 2 Fatores
            ListTile(
              title: const Text('Autenticação de 2 Fatores'),
              trailing: Switch(
                value: _twoFactorAuth,
                onChanged: (value) {
                  setState(() {
                    _twoFactorAuth = value;
                  });
                },
              ),
            ),
            const Divider(),

            // Seção "Sobre" do App
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Sobre o App',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Versão'),
              subtitle: const Text('v1.0.0'),
            ),
            const Divider(),
            ListTile(
              title: const Text('Contato'),
              subtitle: const Text('contato@app.com'),
              onTap: () {
                // Ação ao clicar em Contato
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Redes Sociais'),
              subtitle: const Text('Facebook | Instagram | Twitter'),
              onTap: () {
                // Ação ao clicar nas redes sociais
              },
            ),
          ],
        ),
      ),
    );
  }
}
