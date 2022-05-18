class RelatoryModel {
  String userId;
  String dataInicial;
  String dataFinal;
  String email;
  String? mensagem;
  String? atendenteId;

  RelatoryModel({
    required this.userId,
    required this.dataInicial,
    required this.dataFinal,
    required this.email,
    this.atendenteId,
    this.mensagem,
  });
}
