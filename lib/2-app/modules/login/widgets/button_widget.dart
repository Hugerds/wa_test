import 'package:flutter/material.dart';

import '../../../helpers/cores_aplicativo.dart';
import '../../../helpers/fontes_aplicativo.dart';

class ButtonWidget extends StatelessWidget {
  final String titulo;
  final double? fontSize;
  final Color? color;
  final Color? fontColor;
  final bool? ignoring;
  final double? height;
  final double? width;
  final String? iconePath;
  final void Function()? onPressed;
  const ButtonWidget({Key? key, required this.titulo, this.fontSize, this.color, this.fontColor, this.ignoring, required this.onPressed, this.width, this.height, this.iconePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring ?? false,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(minimumSize: const Size(100, 50), maximumSize: const Size(200, 50), primary: color ?? CoresAplicativo.corPadraoAPlicativo),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: fontSize ?? FontesAplicativo.fonteButtonWidget,
                color: fontColor ?? CoresAplicativo.corPreta,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
