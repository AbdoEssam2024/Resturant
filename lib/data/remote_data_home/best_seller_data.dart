import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/home_links/home_sections.dart';

class BestSellerData {
  Crud crud;

  BestSellerData(this.crud);

  getBestSellerData() async {
    var response = crud.postData(CategoriesApi.bestSellerItems, {});
    return response.fold((l) => l, (r) => r);
  }
}