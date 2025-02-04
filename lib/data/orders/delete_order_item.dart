import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/orders_links/orders_api.dart';

class DeleteOrderItem {
  Crud crud;

  DeleteOrderItem(this.crud);

  deleteOrderItem(int orderItemId) async {
    var response =
        crud.postData(OrdersApi.deleteOrderItem, {"orderItemId": orderItemId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}