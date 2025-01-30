import 'package:either_dart/either.dart';
import 'package:resturant_anj/core/class/crud/crud.dart';
import 'package:resturant_anj/core/constant/api/orders_links/orders_api.dart';

class ChangeOrdersStatus {
  Crud crud;

  ChangeOrdersStatus(this.crud);

  changeOrdersStatus(String status, int orderid) async {
    var response = crud.postData(OrdersApi.changeOrdersStatus,
        {"orderstatus": status, "orderid": orderid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}