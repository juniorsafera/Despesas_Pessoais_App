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
    // ignore: sized_box_for_whitespace
    return Container(
      //color: Colors.amber[100],
      height: 300,
      child: ListView.builder(
        itemCount: widget.transacoes.length,
        itemBuilder: (context, index) {
          final transacao = widget.transacoes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(child: Text('R\$${transacao.valor}')),
                ),
              ),
              title: Text(
                transacao.titulo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(DateFormat('d MMM y').format(transacao.data)),
            ),
          );
        },
      ),
    );
  }
}
