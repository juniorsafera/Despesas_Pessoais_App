import 'dart:math';

import 'package:despesas_pessoais_app/components/form_transacoes.dart';
import 'package:despesas_pessoais_app/components/lista_transicoes.dart';
import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';

class TransacaoUsuario extends StatefulWidget {
  const TransacaoUsuario({Key? key}) : super(key: key);

  @override
  _TransacaoUsuarioState createState() => _TransacaoUsuarioState();
}

class _TransacaoUsuarioState extends State<TransacaoUsuario> {
  final _transacoes = [
    ModeloTransacoes(
      id: 't1',
      titulo: 'novo tenis',
      valor: '90.50',
      data: DateTime.now(),
    ),
    ModeloTransacoes(
      id: 't2',
      titulo: 'nova camisa',
      valor: '45.50',
      data: DateTime.now(),
    ),
    ModeloTransacoes(
      id: 't3',
      titulo: 'nova capinha',
      valor: '22.50',
      data: DateTime.now(),
    ),
    ModeloTransacoes(
      id: 't4',
      titulo: 'Conta luz',
      valor: '135.50',
      data: DateTime.now(),
    ),
    ModeloTransacoes(
      id: 't5',
      titulo: 'Internet',
      valor: '50.00',
      data: DateTime.now(),
    ),
  ];

  _adicionarTransacao(String titulo, double valor) {
    final novaTransacao = ModeloTransacoes(
        id: Random().nextDouble().toString(),
        titulo: titulo,
        valor: valor.toString(),
        data: DateTime.now());

    setState(() {
      _transacoes.add(novaTransacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListaTransacoes(transacoes: _transacoes),
        FormTransacoes(
          onSubmit: _adicionarTransacao,
        ),
      ],
    );
  }
}
