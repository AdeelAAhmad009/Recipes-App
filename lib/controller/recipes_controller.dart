import 'dart:convert';
import 'package:api_project/models/recipes_model.dart';
import 'package:api_project/models/search_model.dart';

import 'package:api_project/services/api_services.dart';
import 'package:get/get.dart';

class RecipesController extends GetxController {
  ApiServices apiServices = ApiServices();
  bool loading = false;
  bool searchLoading = false;
  bool isSearchOn = false;
  RecipesModel? recipesModel;
  Future<void> recipes() async {
    loading = true;
    String? response = await apiServices.recipesResponse();
    if (response != null) {
      final data = jsonDecode(response);
      recipesModel = RecipesModel.fromJson(data);
    }
    loading = false;
    update();
  }

  SearchModel? searchModel;
  Future<void> searchFunction(String s) async {
    searchLoading = true;
    String? response = await apiServices.searchApi(search: s);
    if (response != null) {
      final data = jsonDecode(response);
      searchModel = SearchModel.fromJson(data);
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
    searchLoading = false;
    update();
  }
}
