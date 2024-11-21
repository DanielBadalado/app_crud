import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_app/components/client_widget.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/routes/routes.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtendo o provider de clientes
    final ClientProvider clientes = Provider.of<ClientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // Define a altura da barra de ferramentas
        title: const Text('Lista de clientes'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Navega para o formulário ao clicar no botão de adicionar
              Navigator.of(context).pushNamed(Routes.FORMULARIO);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: clientes.contador, // Obtém o número de clientes via provider
        itemBuilder: (ctx, i) => ClientWidget(
          cliente: clientes.peloIndice(i), // Obtém o cliente pelo índice via provider
        ),
      ),
    );
  }
}
