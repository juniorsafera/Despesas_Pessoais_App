// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'package:despesas_pessoais_app/components/transacao_usuario.dart';

import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              child: const Card(
                color: Colors.lightBlue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            const TransacaoUsuario(),
          ],
        ),
      ),
    );
  }
}
