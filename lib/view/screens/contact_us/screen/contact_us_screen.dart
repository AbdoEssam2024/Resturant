import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/core/constant/routes/app_routes_names.dart';
import 'package:resturant_anj/core/functions/pop_func.dart';
import 'package:resturant_anj/view/core_widgets/pop_widget.dart';
import 'package:resturant_anj/view/screens/contact_us/widgets/contact_widget.dart';
import '../../../../controller/contact_us/contact_us_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../data/const_data/contact_us_data/contact_us_data.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactUsController());
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
            title: Text("Contact Us"),
          ),
          body: Container(
            height: ScreenSize.screenHeight * 0.9,
              padding: EdgeInsets.symmetric(
                vertical: ScreenSize.screenHeight * 0.07,
                  horizontal: ScreenSize.screenWidth * 0.05),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.sp))),
              child: ListView.builder(
                  itemCount: contactUsList.length,
                  itemBuilder: (context, index) => ContactWidget(
                    label: contactUsList[index].label,
                      image: contactUsList[index].image,
                      dropDownWidgets:
                          contactUsList[index].dropDownWidgets))),
        ));
  }
}