class Aluno {
  int? aluMatricula;
  String? aluNome;

  Aluno(int aluMatricula, String aluNome);

  Aluno.fromJson(Map json) {
    aluMatricula = json['aluMatricula'];
    aluNome = json['aluNome'];
  }
}
