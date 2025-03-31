class Tarefa {
  String? aluMatricula;
  String? nomeDestinatario;
  String? titulo;
  String? descricao;
  //String? DataSolicitacao;

  Tarefa(
    String aluMatricula,
    String nomeDestinatario,
    String titulo,
    String descricao,
    //String DataSolicitacao,
  );

  Tarefa.fromJson(Map json) {
    aluMatricula = json['aluMatricula'];
    nomeDestinatario = json['nomeDestinatario'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    //DataSolicitacao = json['DataSolicitacao'];
  }
}
