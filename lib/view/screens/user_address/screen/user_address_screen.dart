import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';

import '../../../../controller/adrress_controller/adrress_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/user_data/user_address_model.dart';
import '../../../core_widgets/pop_widget.dart';
import '../widgets/address_card.dart';

class UserAddressScreen extends GetView<AddressController> {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return PopScopeWidget(
      func: (didpop, result) {
        popFunc(didpop, Get.offNamed(AppRoutesNames.homeScreen));
      },
      widget: Scaffold(
        backgroundColor: AppColors.yellowBase,
        appBar: AppBar(
          backgroundColor: AppColors.yellowBase,
          toolbarHeight: ScreenSize.screenHeight * 0.1,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          title: Text("Delivery Address"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth * 0.03,
              vertical: ScreenSize.screenHeight * 0.08),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
          child: Column(
            children: [
              GetBuilder<AddressController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: SizedBox(
                      height: ScreenSize.screenHeight * 0.6,
                      child: ListView.builder(
                          itemCount: controller.userAddress.length,
                          itemBuilder: (context, index) => AddressCard(
                                userAddressModel: UserAddressModel.fromJson(
                                    controller.userAddress[index]),
                              )),
                    )),
              ),
              MaterialButton(
                onPressed: () {},
                color: AppColors.orangeTwo,
                textColor: AppColors.orange,
                child: Text("Add New Address"),
              )
            ],
          ),
        ),
      ),
    );
  }
}