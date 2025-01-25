class BestSellerDataModel {
  int? itemId;
  String? itemName;
  String? itemImage;
  int? itemCategoryId;
  double? itemPrice;

  BestSellerDataModel(
      {this.itemId,
        this.itemName,
        this.itemImage,
        this.itemCategoryId,
        this.itemPrice});

  BestSellerDataModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemImage = json['item_image'];
    itemCategoryId = json['item_category_id'];
    itemPrice = json['item_price'];
  }
}