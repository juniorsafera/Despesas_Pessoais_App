import 'package:flutter/material.dart';

class FormTransacoes extends StatelessWidget {
  final void Function(String, double) onSubmit;
  const FormTransacoes({Key? key, required this.onSubmit}) : super(key: key);

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
                      final titulo = cTitulo.text;
                      final valor = double.tryParse(cValor.text) ?? 0.00;
                      onSubmit(titulo, valor);
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
