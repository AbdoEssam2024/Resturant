class OffersModel {
  int? offerId;
  int? itemsCategoryId;
  String? offerTitle;
  int? offerDiscount;
  String? offersImage;

  OffersModel(
      {this.offerId,
        this.itemsCategoryId,
        this.offerTitle,
        this.offerDiscount,
        this.offersImage});

  OffersModel.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    itemsCategoryId = json['items_category_id'];
    offerTitle = json['offer_title'];
    offerDiscount = json['offer_discount'];
    offersImage = json['offers_image'];
  }
}