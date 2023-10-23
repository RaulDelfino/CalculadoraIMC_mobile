import 'package:myapp/models/imc_model.dart';

class ImcRepository {
  List<ImcModel> _listaDeImc = [];



  adcionarImc(double altura, double peso) {
    var imc = ImcModel(altura, peso);
    _listaDeImc.add(imc);
  }

  removerImc(ImcModel imc) {
    _listaDeImc.remove(imc);
  }

  List<ImcModel> listarImcs() {
    return _listaDeImc;
  }
}
