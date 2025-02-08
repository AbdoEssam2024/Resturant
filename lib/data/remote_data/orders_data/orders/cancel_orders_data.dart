import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/orders_links/orders_api.dart';

class CancelOrdersData {
  Crud crud;

  CancelOrdersData(this.crud);

  getCancelOrdersData(int userId) async {
    var response =
        crud.postData(OrdersApi.cancelOrders, {"userid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}