import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/orders_links/orders_api.dart';

class OrdersItemsData {
  Crud crud;

  OrdersItemsData(this.crud);

  getOrdersItems(int orderId) async {
    var response =
        crud.postData(OrdersApi.ordersItems, {"orderid": orderId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}