class BestSellerDataModel {
  int? bestId;
  String? itemImage;
  int? itemPriceAft;

  BestSellerDataModel({this.bestId, this.itemImage, this.itemPriceAft});

  BestSellerDataModel.fromJson(Map<String, dynamic> json) {
    bestId = json['best_id'];
    itemImage = json['item_image'];
    itemPriceAft = json['item_price_aft'];
  }
}