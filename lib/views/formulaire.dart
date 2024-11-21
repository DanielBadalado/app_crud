import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/models/client.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formulario = GlobalKey<FormState>();
  final Map<String, String> _dadosFormulario = {};

  void _carregaDadosFormulario(Client cliente) {
    _dadosFormulario['id'] = cliente.id;
    _dadosFormulario['nome'] = cliente.nome;
    _dadosFormulario['sobrenome'] = cliente.sobrenome;
    _dadosFormulario['email'] = cliente.email;
    _dadosFormulario['avatarURL'] = cliente.avatarUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Object? cliente = ModalRoute.of(context)!.settings.arguments;
    if (cliente != null) {
      _carregaDadosFormulario(cliente as Client);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de clientes'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formulario.currentState!.validate()) {
                _formulario.currentState!.save();
                Provider.of<ClientProvider>(context, listen: false).put(
                  Client(
                    id: _dadosFormulario['id'] ?? '',
                    nome: _dadosFormulario['nome'] ?? '',
                    sobrenome: _dadosFormulario['sobrenome'] ?? '',
                    email: _dadosFormulario['email'] ?? '',
                    avatarUrl: _dadosFormulario['avatarURL'] ?? '',
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formulario,
          child: Column(
            children: <Widget>[
              // Campo Nome
              TextFormField(
                initialValue: _dadosFormulario['nome'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Nome Inválido';
                  }
                  if (valor.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['nome'] = valor!,
              ),
              // Campo Sobrenome
              TextFormField(
                initialValue: _dadosFormulario['sobrenome'],
                decoration: const InputDecoration(labelText: 'Sobrenome'),
                onSaved: (valor) => _dadosFormulario['sobrenome'] = valor!,
              ),
              // Campo E-mail
              TextFormField(
                initialValue: _dadosFormulario['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'E-mail Inválido';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(valor)) {
                    return 'Digite um e-mail válido';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['email'] = valor!,
              ),
              // Campo URL do Avatar
              TextFormField(
                initialValue: _dadosFormulario['avatarURL'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (valor) => _dadosFormulario['avatarURL'] = valor!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
