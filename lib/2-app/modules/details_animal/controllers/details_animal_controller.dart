import 'package:wa_test/1-base/models/base.dart';

class DetailsAnimalController {
  late final Base _animal;
  DetailsAnimalController(this._animal);

  //Getters of management state
  Base get animal => _animal;
}
