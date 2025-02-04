import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/class/handling_data_view/handlingdataview.dart';
import 'package:resturant_anj/core/functions/inputs_func.dart';
import '../../../../controller/address_controller/edit_address_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/images/app_images.dart';
import '../../../../core/constant/routes/app_routes_names.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../core/functions/pop_func.dart';
import '../../../core_widgets/custom_form_field.dart';
import '../../../core_widgets/pop_widget.dart';

class EditAddressScreen extends GetView<EditAddressController> {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAddressController());
    return PopScopeWidget(
        func: (didpop, result) {
          popFunc(didpop, Get.offNamed(AppRoutesNames.userAddressScreen));
        },
        widget: Scaffold(
            backgroundColor: AppColors.yellowBase,
            appBar: AppBar(
              backgroundColor: AppColors.yellowBase,
              toolbarHeight: ScreenSize.screenHeight * 0.1,
              leading: IconButton(
                  onPressed: () {
                    Get.offNamed(AppRoutesNames.userAddressScreen);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              title: Text("Edit Your Address"),
            ),
            body: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.sp))),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth * 0.05),
              child: GetBuilder<EditAddressController>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: ScreenSize.screenHeight * 0.05),
                            height: ScreenSize.screenHeight * 0.2,
                            child: Image.asset(
                              AppImages.address,
                              color: AppColors.orange,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Form(
                            key: controller.formKey,
                            child: Column(
                              spacing: ScreenSize.screenHeight * 0.03,
                              children: [
                                Column(
                                  spacing: ScreenSize.screenHeight * 0.008,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Title"),
                                    CostumFormField(
                                        validFunc: (value) {
                                          return validInput(
                                              value!, 3, 15, "title", "Title");
                                        },
                                        feildController:
                                            controller.addressTitle,
                                        secure: false),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: ScreenSize.screenHeight * 0.008,
                                  children: [
                                    Text("Address"),
                                    CostumFormField(
                                        validFunc: (value) {
                                          return validInput(value!, 3, 100,
                                              "address", "Address");
                                        },
                                        feildController: controller.address,
                                        secure: false),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenSize.screenWidth * 0.2),
                            margin: EdgeInsets.only(
                                top: ScreenSize.screenHeight * 0.05),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenSize.screenHeight * 0.02),
                              onPressed: () {
                                controller.editUserAddress();
                              },
                              color: AppColors.orange,
                              textColor: AppColors.white,
                              child: Text(
                                "Save Edits",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          )
                        ],
                      ))),
            )));
  }
}

// Obx(() => Visibility(
//                 maintainState: true,
//                 maintainAnimation: true,
//                 visible: controller.editAddress.value,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     MaterialButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.sp)),
//                       color: AppColors.orange,
//                       textColor: AppColors.white,
//                       onPressed: () {},
//                       child: Text("Save"),
//                     )
//                   ],
//                 )))