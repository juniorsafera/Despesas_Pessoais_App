import 'dart:ffi';

import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {
  final List<ModeloTransacoes> transacoesRecentes;
  const Grafico({Key? key, required this.transacoesRecentes}) : super(key: key);

  List<Map<String, Object>> get grupoTransacoes {
    return List.generate(7, (index) {
      //
      final diaSemana = DateTime.now().subtract(Duration(days: index));
      //
      double somaTotal = 0.00;
      //
      for(var i = 0; i < transacoesRecentes.length; i++){
      bool mesmoDia = transacoesRecentes[i].data.day == diaSemana.day;
      bool mesmoMes = transacoesRecentes[i].data.month == diaSemana.month;
      bool mesmoAno = transacoesRecentes[i].data.year == diaSemana.year;
      //
      if(mesmoDia && mesmoMes && mesmoAno){
        somaTotal += transacoesRecentes[i].valor;
      }
      }
      return {'dia': DateFormat.E().format(diaSemana)[0] , 'valor': somaTotal};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const [],
      ),
    );
  }
}
