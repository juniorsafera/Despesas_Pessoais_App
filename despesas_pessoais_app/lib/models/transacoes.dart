import 'package:flutter/cupertino.dart';

class ModeloTransacoes {
  final String id;
  final String titulo;
  final String valor;
  final DateTime data;

  ModeloTransacoes({
    required this.id,
    required this.titulo,
    required this.valor,
    required this.data,
  });
}
