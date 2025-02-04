class OrdersModel {
  int? orderId;
  int? orderUserId;
  String? orderStatus;
  int? orderTotal;
  String? orderTime;

  OrdersModel(
      {this.orderId,
        this.orderUserId,
        this.orderStatus,
        this.orderTotal,
        this.orderTime});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderStatus = json['order_status'];
    orderTotal = json['order_total'];
    orderTime = json['order_time'];
  }
}