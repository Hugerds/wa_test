import 'package:flutter/material.dart';
import 'package:wa_test/2-app/helpers/cores_aplicativo.dart';
import 'package:wa_test/2-app/modules/login/controllers/login_controller.dart';
import 'package:wa_test/2-app/modules/login/widgets/button_widget.dart';
import 'package:wa_test/2-app/modules/login/widgets/text_field_widget.dart';
import 'package:wa_test/2-app/modules/shared/widgets/loading_widget.dart';

class LoginPage extends StatefulWidget {
  final bool verifyCredentials;
  const LoginPage({Key? key, this.verifyCredentials = true}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _loginController;

  @override
  void initState() {
    _loginController = LoginController(context, widget.verifyCredentials);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _loginController,
          builder: (context, child) => Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: CoresAplicativo.corFundoContainerLogin,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: CoresAplicativo.corFundoLogin,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: CoresAplicativo.corFundoContainerLogin,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: !_loginController.isLoading,
                replacement: const LoadingWidget(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextFieldWidget(
                      labelText: "E-mail",
                      controller: _loginController.inputEmail,
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _loginController.manterConectado = !_loginController.manterConectado),
                      child: Row(
                        children: [
                          AnimatedBuilder(animation: _loginController, builder: (context, child) => Checkbox(value: _loginController.manterConectado, onChanged: (value) => setState(() => _loginController.manterConectado = value ?? false))),
                          const Text("Mantenha-me conectado"),
                        ],
                      ),
                    ),
                    ButtonWidget(onPressed: () => _loginController.btnLogin(), titulo: "LOGIN"),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
