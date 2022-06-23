import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

class LoginService {
  Future<bool> login({required String email}) async {
    try {
      final response = await rootBundle.loadString('lib/2-app/helpers/free_emails.json');
      //generate exception and return empty list if has error
      if (response.isEmpty) throw Exception();
      //return json decode in a dog list if has not error
      final responseDecode = jsonDecode(response);
      List<String> emailsList = (responseDecode as List).map((e) => e['email'].toString().toLowerCase()).toList();
      return emailsList.contains(email);
    } catch (error) {
      log(error.toString(), name: "login Service Error");
      return false;
    }
  }
}
