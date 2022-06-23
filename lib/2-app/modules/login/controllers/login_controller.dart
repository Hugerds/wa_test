// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wa_test/1-base/services/login_service.dart';
import '../../list_animals/pages/list_animals_page.dart';

class LoginController extends ChangeNotifier {
  late final LoginService _loginService;
  late final TextEditingController inputEmail;
  late bool manterConectado;
  late bool _isLoading;
  late final BuildContext _context;
  late final bool _verifyCredentials;

  LoginController(this._context, this._verifyCredentials) {
    _loginService = LoginService();
    _isLoading = false;
    manterConectado = false;
    inputEmail = TextEditingController();
    verifyConnected();
  }

  //Getters of management state
  bool get isLoading => _isLoading;

  //verify sharedpreferences for automatic login
  void verifyConnected() async {
    try {
      _isLoading = true;
      notifyListeners();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      manterConectado = sharedPreferences.getBool("ManterConectado") ?? false;
      if (!manterConectado) throw Exception();
      manterConectado = true;
      String? email = sharedPreferences.getString("Email");
      if (email == null) throw Exception();
      inputEmail.text = email;
      if (_verifyCredentials) await btnLogin();
    } catch (_) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //Login method
  Future<void> btnLogin() async {
    try {
      _isLoading = true;
      notifyListeners();
      final bool loginOk = await _loginService.login(email: inputEmail.text);
      if (loginOk) {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setBool("ManterConectado", manterConectado);
        if (manterConectado) {
          sharedPreferences.setString("Email", inputEmail.text.toLowerCase());
        } else {
          sharedPreferences.remove("Email");
        }
        Navigator.pushReplacement(_context, MaterialPageRoute(builder: (context) => const ListAnimalsPage()));
      } else {
        ScaffoldMessenger.of(_context).showSnackBar(const SnackBar(
          content: Text('O e-mail não está registrado para uso'),
        ));
      }
    } catch (_) {
      ScaffoldMessenger.of(_context).showSnackBar(const SnackBar(
        content: Text('Algo deu errado durante o login'),
      ));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
