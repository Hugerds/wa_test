import 'package:flutter/material.dart';
import 'package:wa_test/2-app/helpers/cores_aplicativo.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: CoresAplicativo.defaultColor));
  }
}
