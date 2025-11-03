import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/voluntario_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final VoluntarioStore store = Modular.get<VoluntarioStore>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    store.loadVoluntario(1); // Exemplo: carregar voluntario logado com ID 1
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.isLoading || store.voluntario == null) {
          return const Center(child: CircularProgressIndicator());
        }

        _nomeController.text = store.voluntario!.nome;
        _emailController.text = store.voluntario!.email;

        return Scaffold(
          appBar: AppBar(title: const Text('Configurações')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _senhaController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    if (_nomeController.text != store.voluntario!.nome) {
                      await store.updateNome(_nomeController.text);
                    }
                    if (_emailController.text != store.voluntario!.email) {
                      await store.updateEmail(_emailController.text);
                    }
                    if (_senhaController.text.isNotEmpty) {
                      await store.updateSenha(_senhaController.text);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Atualizado com sucesso!')),
                    );
                  },
                  child: const Text('Salvar alterações'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
