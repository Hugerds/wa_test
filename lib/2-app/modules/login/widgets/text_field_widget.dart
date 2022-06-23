import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../helpers/cores_aplicativo.dart';
import '../../../helpers/fontes_aplicativo.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? fontSizeHintText;
  final TextEditingController controller;
  final Color? corHintText;
  final FontWeight? fontWeightHintText;
  final String hintText;
  final Widget? iconTextField;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool obrigatorio;
  final int? maxLines;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  const TextFieldWidget({Key? key, required this.labelText, this.fontWeight, this.fontSize, required this.controller, this.corHintText, this.fontWeightHintText, this.hintText = "", this.fontSizeHintText, this.iconTextField, this.inputFormatters, this.keyboardType, this.obscureText = false, this.validator, this.obrigatorio = false, this.maxLines, this.focusNode, this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          counterText: "",
          label: RichText(
              text: TextSpan(
            style: const TextStyle(color: CoresAplicativo.corPreta, fontSize: FontesAplicativo.fonteLabelTextLogin),
            text: labelText,
          )),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: TextStyle(color: corHintText ?? CoresAplicativo.corFonteHintTextLogin, fontWeight: fontWeightHintText ?? FontWeight.w500, fontSize: FontesAplicativo.hintFontLogin),
          labelStyle: TextStyle(
            color: CoresAplicativo.corLabelTextLogin,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? FontesAplicativo.labelFontLogin,
          ),
          suffixIcon: iconTextField,
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder()),
      maxLines: maxLines ?? 1,
      maxLength: 80,
    );
  }

  OutlineInputBorder outlineInputBorder() => const OutlineInputBorder(
        borderSide: BorderSide(color: CoresAplicativo.corBordaTextFieldLogin),
      );
}
