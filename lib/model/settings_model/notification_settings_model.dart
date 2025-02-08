class NotificationSettingsModel {
  int? generalSettings;
  int? sound;
  int? soundCall;
  int? vibrate;
  int? specialOffers;
  int? payment;
  int? discount;
  int? cashBack;

  NotificationSettingsModel(
      {this.generalSettings,
      this.sound,
      this.soundCall,
      this.vibrate,
      this.specialOffers,
      this.payment,
      this.discount,
      this.cashBack});

  NotificationSettingsModel.fromJson(Map<String, dynamic> json) {
    generalSettings = json['general_settings'];
    sound = json['sound'];
    soundCall = json['sound_call'];
    vibrate = json['vibrate'];
    specialOffers = json['special_offers'];
    payment = json['payment'];
    discount = json['discount'];
    cashBack = json['cashBack'];
  }
}
