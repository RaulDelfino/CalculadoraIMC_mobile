import 'package:flutter/material.dart';

class ImcModel {
  final _id = UniqueKey().toString();
  double _altura = 0;
  double _peso = 0;


  ImcModel(this._altura, this._peso);

  double calcularIMC(ImcModel imc) {
    return imc.peso / (imc.altura * imc.altura) ;
  }

  String get id => _id;

  double get altura => _altura;
  double get peso => _peso;

  set altura(double altura) {
    _altura = altura;
  }

  set peso(double peso) {
    _peso = peso;
  }
}
