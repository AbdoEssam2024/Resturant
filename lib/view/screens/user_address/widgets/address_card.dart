import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/address_controller/address_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/images/app_images.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/user_data/user_address_model.dart';
import '../../../core_widgets/custom_form_field.dart';

class AddressCard extends GetView<AddressController> {
  final UserAddressModel userAddressModel;
  final int index;

  const AddressCard(
      {super.key, required this.userAddressModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.screenHeight * 0.22,
      margin: EdgeInsets.only(bottom: ScreenSize.screenHeight * 0.02),
      child: Card(
        color: AppColors.orangeTwo,
        elevation: 20,
        shadowColor: AppColors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.nav_1,
                  color: AppColors.orange,
                ),
                Expanded(
                  child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          CostumFormField(
                              initVal: userAddressModel.addressTitle,
                              secure: false),
                          CostumFormField(
                              initVal: userAddressModel.address, secure: false),
                        ],
                      ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          AwesomeDialog(
                                  context: context,
                                  dismissOnTouchOutside: false,
                                  dialogType: DialogType.info,
                                  title: "Delete Address",
                                  body:
                                      Text("Are You Sure To Delete Address ?"),
                                  btnOkText: "Keep Address",
                                  btnOkColor: AppColors.orange,
                                  btnOkOnPress: () {
                                    Get.back();
                                  },
                                  btnCancelColor:
                                      AppColors.otpaccentDarkGreenColor,
                                  btnCancelText: "Delete Address",
                                  btnCancelOnPress: () {
                                    controller.deleteUserAddressData(index);
                                  },
                                  buttonsTextStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold))
                              .show();
                        },
                        icon: Icon(Icons.remove_circle)),
                    IconButton(
                        onPressed: () {
                          controller.goToEditAddressScreen(index);
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}