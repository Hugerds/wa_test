import 'package:flutter/material.dart';
import 'package:wa_test/2-app/modules/details_animal/pages/details_animal_page.dart';

import '../../../../1-base/models/base.dart';
import '../../shared/widgets/loading_widget.dart';
import 'card_animal_widget.dart';

class ListViewBuilderWidget extends StatelessWidget {
  final List<Base> listCatsOrDog;
  final ScrollController controller;
  final bool isLoading;
  const ListViewBuilderWidget({Key? key, required this.listCatsOrDog, required this.controller, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCatsOrDog.length,
      controller: controller,
      itemBuilder: (context, index) {
        final animal = listCatsOrDog[index];
        if (isLoading && index == listCatsOrDog.length - 1) {
          return const LoadingWidget();
        } else {
          if (animal.url != null) {
            return CardAnimalWidget(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsAnimalPage(animal: animal))),
              breedName: animal.breeds.isEmpty ? "" : animal.breeds.first.name,
              yearsOld: animal.breeds.isEmpty ? "" : animal.breeds.first.lifeSpan ?? "",
              id: animal.id,
              maxWidht: (animal.width / 2).round(),
              maxHeight: (animal.height / 2).round(),
              url: animal.url!,
            );
          }
          return Container();
        }
      },
    );
  }
}
