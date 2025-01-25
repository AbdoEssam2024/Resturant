import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_anj/controller/home/home_controller.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/screen_size/screen_size.dart';
import '../../../../model/home/best_seller_model.dart';

class BestSellerView extends GetView<HomeController> {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        height: ScreenSize.screenHeight * 0.3,
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   "Best Seller",
                   style: TextStyle(
                       color: AppColors.brown,
                       fontSize: 24.sp,
                       fontFamily: "cairo",
                       fontWeight: FontWeight.bold),
                 ),
                 TextButton.icon(
                     iconAlignment: IconAlignment.end,
                     label: Text(
                       "View All",
                       style: TextStyle(
                         fontFamily: "cairo",
                         fontWeight: FontWeight.bold,
                         color: AppColors.orange,
                       ),
                     ),
                     onPressed: () {},
                     icon:
                         Icon(Icons.arrow_forward_ios, color: AppColors.orange))
               ],
             ),
            SizedBox(

                height: ScreenSize.screenHeight * 0.23,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.bestSeller.length,
                    itemBuilder: (context, index) => BestSellerItems(
                          bestSellerDataModel: BestSellerDataModel.fromJson(
                              controller.bestSeller[index]),
                        )))
          ],
        ));
  }
}

class BestSellerItems extends StatelessWidget {
  final BestSellerDataModel bestSellerDataModel;

  const BestSellerItems({super.key, required this.bestSellerDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenSize.screenWidth * 0.4,
        decoration: BoxDecoration(

        ),
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.screenHeight * 0.01),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                bestSellerDataModel.itemImage!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                right: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )),
                  width: ScreenSize.screenWidth * 0.18,
                  height: ScreenSize.screenHeight * 0.04,
                  child: Text(
                    textAlign: TextAlign.center,
                    "${bestSellerDataModel.itemPrice!.toDouble()}\$",
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: "cairo",
                        fontSize: 16.sp),
                  ),
                ))
          ],
        ));
  }
}