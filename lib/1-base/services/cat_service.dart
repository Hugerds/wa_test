import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:wa_test/1-base/models/base.dart';
import '../../2-app/helpers/env.dart';
import '../interfaces/ibase_service.dart';
import '../models/cat.dart';

class CatService implements IBaseService {
  @override
  Future<List<Base>> getAnimals({required int page, required String primaryUrl}) async {
    try {
      final Uri url = Uri.https(primaryUrl, "/v1/images/search", {"limit": 10.toString(), "page": page.toString(), "has_breeds": true.toString()});
      final response = await get(url, headers: {"x-api-key": Env.apiKey});
      //generate exception and return empty list if has error
      if (response.statusCode != 200 || response.body.isEmpty) throw Exception();
      //return json decode in a dog list if has not error
      final responseDecode = jsonDecode(response.body);
      return (responseDecode as List).map((e) => Cat.fromJson(e)).toList();
    } catch (error) {
      log(error.toString(), name: "searchDogs Service Error");
      return <Base>[];
    }
  }
}
