class Client {
  final String id;
  final String nome;
  final String sobrenome;
  final String email;
  final String avatarUrl;

  const Client({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.avatarUrl,
  });

  // Método toJson para converter um objeto Client para um mapa
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }
}
