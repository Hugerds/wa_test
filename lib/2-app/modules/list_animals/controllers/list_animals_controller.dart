import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:wa_test/1-base/models/dog.dart';
import 'package:wa_test/1-base/services/cat_service.dart';
import 'package:wa_test/1-base/services/dog_service.dart';
import '../../../../1-base/models/cat.dart';

class ListAnimalsController extends ChangeNotifier {
  late final List<Dog> _listDogs;
  late final List<Cat> _listCats;
  late int _pageDogService;
  late int _pageCatService;
  late final DogService _dogService;
  late final CatService _catService;
  late bool isLoading;
  late bool isLoadingDog;
  late bool isLoadingCat;
  late final TabController tabController;
  late final ScrollController _scrollControllerDogList;
  late final ScrollController _scrollControllerCatList;

  ListAnimalsController() {
    _listDogs = <Dog>[];
    _listCats = <Cat>[];
    _dogService = DogService();
    _catService = CatService();
    _pageDogService = 1;
    _pageCatService = 1;
    isLoading = false;
    isLoadingDog = false;
    isLoadingCat = false;
    _scrollControllerDogList = ScrollController()..addListener(_scrollListenerDogList);
    _scrollControllerCatList = ScrollController()..addListener(_scrollListenerCatList);
  }

  //Getters of management state
  UnmodifiableListView<Dog> get listDogs => UnmodifiableListView(_listDogs);
  UnmodifiableListView<Cat> get listCats => UnmodifiableListView(_listCats);
  ScrollController get scrollControllerDogList => _scrollControllerDogList;
  ScrollController get scrollControllerCatList => _scrollControllerCatList;

  Future<void> sincronize() async {
    isLoading = true;
    await searchDogs();
    await searchCats();
    isLoading = false;
    notifyListeners();
  }

  //Listener for scroll list dog
  void _scrollListenerDogList() {
    if (_scrollControllerDogList.position.pixels >= _scrollControllerDogList.position.maxScrollExtent - 50) {
      if (!isLoadingDog) searchDogs();
    }
    notifyListeners();
  }

  //Listener for scroll list cat
  void _scrollListenerCatList() {
    if (_scrollControllerCatList.position.pixels >= _scrollControllerCatList.position.maxScrollExtent - 50) {
      if (!isLoadingCat) searchCats();
    }
    notifyListeners();
  }

  //Method to comunicate controller with service
  Future<void> searchDogs({String? name}) async {
    try {
      isLoadingDog = true;
      notifyListeners();
      //add all items of method getDogs of service return
      _listDogs.addAll(await _dogService.getAnimals(page: _pageDogService, primaryUrl: "api.thedogapi.com") as List<Dog>);
    } catch (error) {
      _listDogs = UnmodifiableListView([]);
    } finally {
      isLoadingDog = false;
      notifyListeners();
      //increment page api for more results on next call
      _pageDogService++;
    }
  }

  //Method to comunicate controller with service
  Future<void> searchCats({String? name}) async {
    try {
      isLoadingCat = true;
      //add all items of method getDogs of service return
      _listCats.addAll(await _catService.getAnimals(page: _pageCatService, primaryUrl: "api.thecatapi.com") as List<Cat>);
    } catch (error) {
      _listCats = UnmodifiableListView([]);
    } finally {
      isLoadingCat = false;
      //increment page api for more results on next call
      _pageCatService++;
    }
  }
}
