class RecommendedModel {
  int? itemId;
  String? itemName;
  String? itemImage;
  int? itemPrice;
  double? itemRate;
  int? itemCategoryId;

  RecommendedModel(
      {this.itemId,
        this.itemName,
        this.itemImage,
        this.itemPrice,
        this.itemRate,
        this.itemCategoryId});

  RecommendedModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemImage = json['item_image'];
    itemPrice = json['item_price'];
    itemRate = json['item_rate'];
    itemCategoryId = json['item_category_id'];
  }
}