import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/orders_links/orders_api.dart';

class CompleteOrdersData {
  Crud crud;

  CompleteOrdersData(this.crud);

  getCompleteOrdersData(int userId) async {
    var response =
        crud.postData(OrdersApi.completeOrders, {"userid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}