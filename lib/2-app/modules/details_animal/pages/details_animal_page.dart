import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wa_test/1-base/models/base.dart';
import 'package:wa_test/2-app/helpers/cores_aplicativo.dart';
import 'package:wa_test/2-app/modules/details_animal/controllers/details_animal_controller.dart';
import 'package:wa_test/2-app/modules/list_animals/widgets/card_infos_animal_widget.dart';

class DetailsAnimalPage extends StatefulWidget {
  final Base animal;
  const DetailsAnimalPage({Key? key, required this.animal}) : super(key: key);

  @override
  State<DetailsAnimalPage> createState() => _DetailsAnimalPageState();
}

class _DetailsAnimalPageState extends State<DetailsAnimalPage> {
  late DetailsAnimalController _detailsDogController;

  @override
  void initState() {
    _detailsDogController = DetailsAnimalController(widget.animal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: _detailsDogController.animal.id,
                      child: Image(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          _detailsDogController.animal.url!,
                          maxHeight: 744,
                          maxWidth: 1080,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            icon: Container(
                              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: CoresAplicativo.corPreta.withOpacity(0.5)),
                              child: const Icon(Icons.arrow_back_ios, color: CoresAplicativo.corBranca),
                            ),
                            onPressed: () => Navigator.pop(context)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: CoresAplicativo.corBranca,
                ),
              ),
            ],
          ),
          Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: CardInfosAnimalWidget(
                    breedName: _detailsDogController.animal.breeds.isEmpty ? "" : _detailsDogController.animal.breeds.first.name,
                    yearsOld: _detailsDogController.animal.breeds.isEmpty ? "" : _detailsDogController.animal.breeds.first.lifeSpan ?? '',
                  )))
        ],
      ),
    );
  }
}
