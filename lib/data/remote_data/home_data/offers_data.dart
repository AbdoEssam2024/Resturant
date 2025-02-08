import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/home_links/home_sections.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getOffersData() async {
    var response = crud.postData(CategoriesApi.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}