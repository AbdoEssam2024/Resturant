class OrdersItemsModel {
  int? orderId;
  int? orderUserId;
  String? orderStatus;
  int? orderTotal;
  String? orderTime;
  int? quantity;
  int? itemId;
  int? orderItemsId;
  String? itemStatus;
  String? itemName;
  int? itemPriceAft;
  String? itemImage;

  OrdersItemsModel(
      {this.orderId,
        this.orderUserId,
        this.orderStatus,
        this.orderTotal,
        this.orderTime,
        this.quantity,
        this.itemId,
        this.orderItemsId,
        this.itemStatus,
        this.itemName,
        this.itemPriceAft,
        this.itemImage});

  OrdersItemsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderStatus = json['order_status'];
    orderTotal = json['order_total'];
    orderTime = json['order_time'];
    quantity = json['quantity'];
    itemId = json['item_id'];
    orderItemsId = json['order_items_id'];
    itemStatus = json['item_status'];
    itemName = json['item_name'];
    itemPriceAft = json['item_price_aft'];
    itemImage = json['item_image'];
  }
}