import 'package:flutter/material.dart';
import 'package:myapp/models/imc_model.dart';

import 'package:myapp/repository/imc_repository.dart';
import 'package:myapp/widgets/show_modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _listaDeImc = [];

  var listaImcRepository = ImcRepository();

  @override
  void initState() {
    super.initState();
    _listaDeImc = listaImcRepository.listarImcs();
  }

  obterDados(double altura, double peso) {
    listaImcRepository.adcionarImc(altura, peso);
    _listaDeImc = listaImcRepository.listarImcs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          widget.title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: _listaDeImc.length,
          itemBuilder: (BuildContext bc, int index) {
            var imc = _listaDeImc[index];
            return Dismissible(
                onDismissed: (DismissDirection dismissDirection) async {
                  listaImcRepository.removerImc(imc);
                  listaImcRepository.listarImcs();
                },
                key: Key(imc.id),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(imc.calcularIMC(imc).toStringAsFixed(2))),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        onPressed: () {
          showModalBottomSheet(
              showDragHandle: true,
              context: context,
              builder: (BuildContext bc) {
                return ShowMOdel(callback: obterDados);
              });
        },
        tooltip: 'Calcular IMC',
        child: const Icon(
          Icons.calculate_outlined,
          size: 40,
        ),
      ),
    );
  }
}
