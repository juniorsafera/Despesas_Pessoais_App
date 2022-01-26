import 'package:despesas_pessoais_app/components/barra_grafico.dart';
import 'package:despesas_pessoais_app/models/transacoes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {
  final List<ModeloTransacoes> transacoesRecentes;
  const Grafico({Key? key, required this.transacoesRecentes}) : super(key: key);

  // INÍCIO GRUPO DE TRANSAÕES
  List<Map<String, Object>> get grupoTransacoes {
    return List.generate(7, (index) {
      //
      final diaSemana = DateTime.now().subtract(Duration(days: index));
      //
      double somaTotal = 0.00;
      //
      for (var i = 0; i < transacoesRecentes.length; i++) {
        bool mesmoDia = transacoesRecentes[i].data.day == diaSemana.day;
        bool mesmoMes = transacoesRecentes[i].data.month == diaSemana.month;
        bool mesmoAno = transacoesRecentes[i].data.year == diaSemana.year;
        //
        if (mesmoDia && mesmoMes && mesmoAno) {
          somaTotal += transacoesRecentes[i].valor;
        }
      }

      return {'dia': DateFormat.E().format(diaSemana)[0], 'valor': somaTotal};
    });
  }
  // FIM GRUPO DE TRANSAÕES

  double get _valorTotalSemana {
    return grupoTransacoes.fold(
        0.0, (soma, item) => soma + double.parse(item['valor'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grupoTransacoes.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarraGrafico(
                  labelDia: tr['dia'].toString(),
                  valor: double.parse(tr['valor'].toString()),
                  porcentagem:
                      double.parse(tr['valor'].toString()) / _valorTotalSemana),
            );
          }).toList(),
        ),
      ),
    );
  }
}
