import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTransacoes extends StatelessWidget {
  final List<ModeloTransacoes> transacoes;
  const ListaTransacoes({Key? key, required this.transacoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...transacoes.map((transacao) => Container(
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
    );
  }
}
