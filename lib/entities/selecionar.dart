class Selecionar {
  final String titulo;
  final String type;
  final List<String> options;
  final Function(String value) callback;
  final String textoApoio;
  final bool hasImagem;
  final List<String> imagens;
  final List<String> nomeImagem;

  Selecionar(
      {required this.titulo,
      required this.type,
      required this.options,
      required this.callback,
      required this.textoApoio,
      required this.hasImagem,
      required this.imagens,
      required this.nomeImagem});
}
