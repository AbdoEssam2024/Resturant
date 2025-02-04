class UserAddressModel {
  int? addressId;
  int? userId;
  String? address;
  String? addressTitle;

  UserAddressModel({this.addressId, this.userId, this.address, this.addressTitle});

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    userId = json['user_id'];
    address = json['address'];
    addressTitle = json['address_title'];
  }
}