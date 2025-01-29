import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/home_links/home_sections.dart';

class RecommendData {
  Crud crud;

  RecommendData(this.crud);

  getRecommendData() async {
    var response = crud.postData(CategoriesApi.recommend, {});
    return response.fold((l) => l, (r) => r);
  }
}