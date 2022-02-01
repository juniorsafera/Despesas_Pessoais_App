import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaTransacoes extends StatefulWidget {
  final List<ModeloTransacoes> transacoes;
  final void  Function (String) removerTransacao;
  const ListaTransacoes({Key? key, required this.transacoes, required this.removerTransacao}) : super(key: key);

  @override
  State<ListaTransacoes> createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        itemCount: widget.transacoes.length,
        itemBuilder: (context, index) {
          final transacao = widget.transacoes[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: FittedBox(
                      child: Text(
                    'R\$${transacao.valor}',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
              title: Text(
                transacao.titulo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(DateFormat('d MMM y').format(transacao.data)),
              trailing: IconButton(
                  onPressed: () =>  widget.removerTransacao(transacao.id),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          );
        },
      ),
    );
  }
}
