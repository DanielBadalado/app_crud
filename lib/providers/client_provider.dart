import 'dart:math';
import 'package:crud_app/models/client.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/services/client_service.dart';

class ClientProvider with ChangeNotifier {
  final ClientService _service = ClientService();
  Map<String, Client> _itens = {};
  ClientProvider() {
    _service.encontrar().then((value) => {_itens = value, notifyListeners()});
  }

  get contador => null;

  void put(Client cliente) async {
    await _service.salvar(cliente);
    _service.encontrar().then((value) => {_itens = value, notifyListeners()});
  }

  void remove(String id) {
    _service.remover(id).then((value) => {_itens = value, notifyListeners()});
  }

  peloIndice(int i) {}
}
