import 'package:flutter/widgets.dart';

class Escrever {
  final String titulo;
  final String type;
  final VoidCallback callback;
  final Function(String value) onSubmitted;

  Escrever(
      {required this.titulo,
      required this.type,
      required this.callback,
      required this.onSubmitted});
}
