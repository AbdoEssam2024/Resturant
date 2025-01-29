class OrdersModel {
  int? orderId;
  int? orderUserId;
  String? orderStatus;
  int? orderTotal;
  int? quantity;
  int? itemId;
  String? offerTitle;
  int? offerDiscount;
  String? offersImage;
  String? itemName;

  OrdersModel(
      {this.orderId,
        this.orderUserId,
        this.orderStatus,
        this.orderTotal,
        this.quantity,
        this.itemId,
        this.offerTitle,
        this.offerDiscount,
        this.offersImage,
        this.itemName});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserId = json['order_user_id'];
    orderStatus = json['order_status'];
    orderTotal = json['order_total'];
    quantity = json['quantity'];
    itemId = json['item_id'];
    offerTitle = json['offer_title'];
    offerDiscount = json['offer_discount'];
    offersImage = json['offers_image'];
    itemName = json['item_name'];
  }
}