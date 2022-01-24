import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTransacoes extends StatefulWidget {
  final List<ModeloTransacoes> transacoes;
  const ListaTransacoes({Key? key, required this.transacoes}) : super(key: key);

  @override
  State<ListaTransacoes> createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber[100],
      height: 300,
      child: ListView.builder(
        itemCount: widget.transacoes.length,
        itemBuilder: (context, index) {
          final transacao = widget.transacoes[index];
          return Card(
            elevation: 5,
            child: Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          );
        },
      ),
    );
  }
}
