// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormTransacoes extends StatefulWidget {
  final void Function(String, double) onSubmit;
  const FormTransacoes({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<FormTransacoes> createState() => _FormTransacoesState();
}

final TextEditingController cTitulo = TextEditingController();
final TextEditingController cValor = TextEditingController();
DateTime? _dataSelecionada;

class _FormTransacoesState extends State<FormTransacoes> {
  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final titulo = cTitulo.text;
      final valor = double.tryParse(cValor.text) ?? 0.00;

      if (titulo.isEmpty || valor <= 0) {
        return;
      }

      widget.onSubmit(titulo, valor);
      cTitulo.clear();
      cValor.clear();
    }

    _abrirCalendario() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == null) {
          return;
        }
        setState(() {
          _dataSelecionada = value;
        });
      });
    }

    // ignore: avoid_unnecessary_containers
    return Container(
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
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: cValor,
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    // const TextInputType.numberWithOptions(decimal: true),
                    TextInputType.number,
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 70,
                child: Row(
                  children: [
                    // ignore: prefer_const_constructors
                    Expanded(
                      child: Text(_dataSelecionada == null
                          ? "Nenhuma data selecionada!"
                          : "Data selecionada: ${DateFormat('dd/MM/y').format(_dataSelecionada!)}"),
                    ),
                    // ignore: prefer_const_constructors
                    FlatButton(
                        onPressed: _abrirCalendario,
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Selecionar Data",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.purple,
                    onPressed: _submitForm,
                    child: const Text(
                      'Nova Transação',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
