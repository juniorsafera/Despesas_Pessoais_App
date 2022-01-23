import 'package:flutter/material.dart';

class FormTransacoes extends StatelessWidget {
  const FormTransacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController cTitulo = TextEditingController();
    final TextEditingController cValor = TextEditingController();

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: cTitulo,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: cValor,
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                    textColor: Colors.purple,
                    onPressed: () {
                      // ignore: avoid_print
                      print(cTitulo.text);
                    },
                    child: const Text('Nova Transação')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
