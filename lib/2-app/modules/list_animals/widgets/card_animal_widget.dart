import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wa_test/2-app/helpers/cores_aplicativo.dart';
import 'package:wa_test/2-app/modules/list_animals/widgets/card_infos_animal_widget.dart';

class CardAnimalWidget extends StatelessWidget {
  final String breedName;
  final String yearsOld;
  final String id;
  final String url;
  final int maxWidht;
  final int maxHeight;
  final void Function() onTap;

  const CardAnimalWidget({Key? key, required this.breedName, required this.yearsOld, required this.id, required this.maxWidht, required this.maxHeight, required this.url, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(width: MediaQuery.of(context).size.width * 0.65, height: MediaQuery.of(context).size.height * 0.2, child: CardInfosAnimalWidget(breedName: breedName, yearsOld: yearsOld)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                      tag: id,
                      child: Image(
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            color: CoresAplicativo.corCardListAnimals,
                            height: 428,
                            width: 540,
                            child: Container(color: CoresAplicativo.corPadraoAPlicativo, child: const Center(child: CircularProgressIndicator())),
                          );
                        },
                        image: CachedNetworkImageProvider(
                          url,
                          maxHeight: maxHeight,
                          maxWidth: maxHeight,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
