import 'package:flutter/material.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/images/app_images.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/user_data/user_address_model.dart';

class AddressCard extends StatelessWidget {
  final UserAddressModel userAddressModel ;
  const AddressCard({super.key, required this.userAddressModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenSize.screenHeight * 0.03),
      child: Card(
        color: AppColors.orangeTwo,
        elevation: 20,
        shadowColor: AppColors.orange,
        child: ListTile(
          leading: Image.asset(
            AppImages.nav_1,
            color: AppColors.orange,
          ),
          title: Text(userAddressModel.addressTitle!),
          subtitle: Text(userAddressModel.address!),
          trailing:
          IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
        ),
      ),
    );
  }
}