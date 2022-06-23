import 'package:flutter/material.dart';
import 'package:wa_test/2-app/helpers/fontes_aplicativo.dart';

import '../../../helpers/cores_aplicativo.dart';

class CardInfosAnimalWidget extends StatelessWidget {
  final String breedName;
  final String yearsOld;
  const CardInfosAnimalWidget({Key? key, required this.breedName, required this.yearsOld}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              breedName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontesAplicativo.corPadraoTituloCardsAplicativo,
                color: CoresAplicativo.corPreta,
              ),
            ),
            Text(
              yearsOld,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: FontesAplicativo.corPadraoCardsAplicativo,
                color: CoresAplicativo.corFonteCard,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: CoresAplicativo.corFonteCard,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
