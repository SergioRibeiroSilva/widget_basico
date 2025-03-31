class PolicialPttc {
  int? pes_codigo;
  String? pes_nome;
  String? pes_telefone_celular;

  PolicialPttc(
    int pes_codigo,
    String pes_nome,
    String pes_telefone_celular,
  );

  PolicialPttc.fromJson(Map json) {
    pes_codigo = json['pes_codigo'];
    pes_nome = json['pes_nome'];
    pes_telefone_celular = json['pes_telefone_celular'];
  }
}
