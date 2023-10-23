import 'package:flutter/material.dart';
import 'package:myapp/models/imc_model.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/repository/imc_repository.dart';

class ShowMOdel extends StatefulWidget {
  const ShowMOdel({super.key, required this.callback});
  final Function(double, double) callback;

  @override
  State<ShowMOdel> createState() => _ShowMOdelState();
}

class _ShowMOdelState extends State<ShowMOdel> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  var imcRepository = ImcRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(children: [
        TextField(
          controller: alturaController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Altura"),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: pesoController,
          decoration: InputDecoration(hintText: "Peso"),
        ),
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 40,
            width: double.infinity,
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Salvar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
              widget.callback(
                  double.tryParse(alturaController.text) ?? 0.0,
                  double.tryParse(pesoController.text) ?? 0.0,
                );
                
                Navigator.pop(context);
              },
            ),
          ),
        )
      ]),
    );
  }
}
