import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/orders_links/orders_api.dart';

class ActiveOrdersData {
  Crud crud;

  ActiveOrdersData(this.crud);

  getActiveOrdersData(int userId) async {
    var response =
        crud.postData(OrdersApi.activeOrders, {"userid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}