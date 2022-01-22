import 'package:flutter/material.dart';

class FormTransacoes extends StatelessWidget {
  const FormTransacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
