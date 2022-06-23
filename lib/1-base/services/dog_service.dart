import 'dart:convert';
import 'dart:developer';

import 'package:wa_test/1-base/interfaces/ibase_service.dart';
import 'package:wa_test/1-base/models/base.dart';
import 'package:wa_test/2-app/helpers/env.dart';

import '../models/dog.dart';
import 'package:http/http.dart';

class DogService implements IBaseService {
  @override
  Future<List<Base>> getAnimals({required int page, required String primaryUrl}) async {
    try {
      final Uri url = Uri.https(primaryUrl, "/v1/images/search", {"limit": 10.toString(), "page": page.toString(), "has_breeds": true.toString()});
      final response = await get(url, headers: {"x-api-key": Env.apiKey});
      //generate exception and return empty list if has error
      if (response.statusCode != 200 || response.body.isEmpty) throw Exception();
      //return json decode in a dog list if has not error
      final responseDecode = jsonDecode(response.body);
      return (responseDecode as List).map((e) => Dog.fromJson(e)).toList();
    } catch (error) {
      log(error.toString(), name: "getAnimals Service Error");
      return <Base>[];
    }
  }
}
