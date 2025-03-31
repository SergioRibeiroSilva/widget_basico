class AfastamentoPolicial {
  int? paf_codigo;
  String? tpa_abreviatura;

  AfastamentoPolicial(
    int paf_codigo,
    String tpa_abreviatura,
  );

  AfastamentoPolicial.fromJson(Map json) {
    paf_codigo = json['paf_codigo'];
    tpa_abreviatura = json['tpa_abreviatura'];
  }
}
