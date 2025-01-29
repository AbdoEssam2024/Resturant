import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/home_links/home_sections.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);

  getCatigoriesData() async {
    var response = crud.postData(CategoriesApi.categories, {});

    return response.fold((l) => l, (r) => r);
  }
}