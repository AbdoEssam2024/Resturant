class OrdersModel {
  int? orderId;
  int? orderUserId;
  String? orderStatus;
  int? orderTotal;
  String? orderTime;
  int? quantity;
  int? itemId;
  String? itemName;
  int? itemPriceAft;
  String? itemImage;

  OrdersModel(
      {this.orderId,
        this.orderUserId,
        this.orderStatus,
        this.orderTotal,
        this.orderTime,
        this.quantity,
        this.itemId,
        this.itemName,
        this.itemPriceAft,
        this.itemImage});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderStatus = json['order_status'];
    orderTotal = json['order_total'];
    orderTime = json['order_time'];
    quantity = json['quantity'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPriceAft = json['item_price_aft'];
    itemImage = json['item_image'];
  }
}