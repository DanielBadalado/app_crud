import 'client.dart';

abstract class ClientDAO {
  Future<Map<String, Client>> encontrar();
  Future<Map<String, Client>> remover(dynamic id);  // Alterado para dynamic
  Future<void> salvar(Client cliente);
}
