import 'package:flutter/material.dart';
import 'package:wa_test/2-app/helpers/cores_aplicativo.dart';
import 'package:wa_test/2-app/modules/list_animals/controllers/list_animals_controller.dart';
import 'package:wa_test/2-app/modules/login/pages/login_page.dart';
import '../../shared/widgets/loading_widget.dart';
import '../widgets/list_view_builder_widget.dart';

class ListAnimalsPage extends StatefulWidget {
  const ListAnimalsPage({Key? key}) : super(key: key);

  @override
  State<ListAnimalsPage> createState() => _ListAnimalsPageState();
}

class _ListAnimalsPageState extends State<ListAnimalsPage> with TickerProviderStateMixin {
  late final ListAnimalsController _listAnimalsController;

  @override
  void initState() {
    _listAnimalsController = ListAnimalsController();
    _listAnimalsController.tabController = TabController(length: 2, vsync: this);
    //init with a search of animals
    WidgetsBinding.instance.addPostFrameCallback((_) async => _listAnimalsController.sincronize());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresAplicativo.corFundoListaAnimals,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage(
                            verifyCredentials: false,
                          ))),
              icon: const Icon(Icons.exit_to_app)),
        ],
        bottom: TabBar(
          controller: _listAnimalsController.tabController,
          tabs: const [
            Tab(
              text: "Cachorros",
            ),
            Tab(
              text: "Gatos",
            )
          ],
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _listAnimalsController,
          builder: (context, child) => Visibility(
            visible: !_listAnimalsController.isLoading,
            replacement: const LoadingWidget(),
            child: TabBarView(controller: _listAnimalsController.tabController, children: [
              AnimatedBuilder(
                animation: _listAnimalsController,
                builder: (context, child) => ListViewBuilderWidget(
                  listCatsOrDog: _listAnimalsController.listDogs,
                  controller: _listAnimalsController.scrollControllerDogList,
                  isLoading: _listAnimalsController.isLoadingDog,
                ),
              ),
              AnimatedBuilder(
                animation: _listAnimalsController,
                builder: (context, child) => ListViewBuilderWidget(
                  listCatsOrDog: _listAnimalsController.listCats,
                  controller: _listAnimalsController.scrollControllerCatList,
                  isLoading: _listAnimalsController.isLoadingCat,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
