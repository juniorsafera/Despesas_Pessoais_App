// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            child: const Card(
              color: Colors.lightBlue,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ..._transacoes.map((transacao) => Container(
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(
                                'R\$ ${transacao.valor}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transacao.titulo,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM y').format(transacao.data),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'Título'),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Valor'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          textColor: Colors.purple,
                          onPressed: () {},
                          child: const Text('Nova Transação')),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
