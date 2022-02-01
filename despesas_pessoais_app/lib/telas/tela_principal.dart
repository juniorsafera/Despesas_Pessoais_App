// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'dart:math';

import 'package:despesas_pessoais_app/components/form_transacoes.dart';
import 'package:despesas_pessoais_app/components/grafico.dart';
import 'package:despesas_pessoais_app/components/lista_transicoes.dart';
import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  
  
  final _transacoes = [
    ModeloTransacoes(
      id: 't1',
      titulo: 'novo tenis',
      valor: 10,
      data: DateTime.now().subtract(const Duration(days: 3)),
    ),   
  ];

  List<ModeloTransacoes> get _transacoesRecentes {
    return _transacoes
        .where((element) => element.data
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  _adicionarTransacao(String titulo, double valor, DateTime data) {
    final novaTransacao = ModeloTransacoes(
        id: Random().nextDouble().toString(),
        titulo: titulo,
        valor: valor,
        data: data);

    setState(() {
      _transacoes.add(novaTransacao);
    });
    // FECHAR FORMULARIO DE TRANSAÇÕES
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _abrirFormularioTransacoes() {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return FormTransacoes(onSubmit: _adicionarTransacao);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
              onPressed: () {
                _abrirFormularioTransacoes();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: _transacoesRecentes.isEmpty
            ? const Text("Nenhuma Transação Cadastrada!")
            : Column(
                children: [
                  Grafico(transacoesRecentes: _transacoesRecentes),
                  ListaTransacoes(transacoes: _transacoes),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _abrirFormularioTransacoes();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
