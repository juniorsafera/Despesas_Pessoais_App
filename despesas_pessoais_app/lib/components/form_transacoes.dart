// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FormTransacoes extends StatefulWidget {
  final void Function(String, double) onSubmit;
  const FormTransacoes({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<FormTransacoes> createState() => _FormTransacoesState();
}

class _FormTransacoesState extends State<FormTransacoes> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cTitulo = TextEditingController();
    final TextEditingController cValor = TextEditingController();

    _submitForm() {
      final titulo = cTitulo.text;
      final valor = double.tryParse(cValor.text) ?? 0.00;

      if (titulo.isEmpty || valor <= 0) {
        return;
      }

      widget.onSubmit(titulo, valor);
    }

    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextField(
                controller: cTitulo,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: cValor,
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      textColor: Colors.purple,
                      onPressed: _submitForm,
                      child: const Text('Nova Transação')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
