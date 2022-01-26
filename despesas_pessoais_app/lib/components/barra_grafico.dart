import 'package:flutter/material.dart';

class BarraGrafico extends StatelessWidget {
  final String labelDia;
  final double valor;
  final double porcentagem;

  const BarraGrafico({
    Key? key,
    required this.labelDia,
    required this.valor,
    required this.porcentagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
            height: 20,
            child: FittedBox(child: Text(valor.toStringAsFixed(2)))),
        const SizedBox(
          height: 5,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: null,
              ),
              FractionallySizedBox(
                heightFactor: porcentagem,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(labelDia),
      ],
    );
  }
}
