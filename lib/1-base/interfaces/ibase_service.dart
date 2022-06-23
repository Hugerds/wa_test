import 'package:wa_test/1-base/models/base.dart';

abstract class IBaseService {
  Future<List<Base>> getAnimals({required int page, required String primaryUrl});
}
