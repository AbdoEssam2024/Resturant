import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import '../../../../controller/address_controller/address_controller.dart';
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
          leading: IconButton(
              onPressed: () {
                Get.offNamed(AppRoutesNames.homeScreen);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text("Delivery Address"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.screenWidth * 0.03,
              vertical: ScreenSize.screenHeight * 0.05),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
          child: ListView(
            children: [
              GetBuilder<AddressController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: SizedBox(
                      height: ScreenSize.screenHeight * 0.67,
                      child: ListView.builder(
                          itemCount: controller.userAddress.length,
                          itemBuilder: (context, index) => AddressCard(
                                index: index,
                                userAddressModel: UserAddressModel.fromJson(
                                    controller.userAddress[index]),
                              )),
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.screenWidth * 0.2),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
                  onPressed: () {
                    controller.goToAddAddressScreen();
                  },
                  color: AppColors.otpaccentYellowColor,
                  textColor: AppColors.orange,
                  child: Text(
                    "Add New Address",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}