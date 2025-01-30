class OffersModel {
  int? offerId;
  String? offerTitle;
  int? offerPrice;
  int? offerDiscount;
  String? itemName;
  String? itemImage;

  OffersModel(
      {this.offerId,
        this.offerTitle,
        this.offerPrice,
        this.offerDiscount,
        this.itemName,
        this.itemImage});

  OffersModel.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerTitle = json['offer_title'];
    offerPrice = json['offer_price'];
    offerDiscount = json['offer_discount'];
    itemName = json['item_name'];
    itemImage = json['item_image'];
  }
}