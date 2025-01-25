import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resturant_anj/core/class/status_request/statusrequest.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImages.loading))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Lottie.asset(AppImages.offline))
            : statusRequest == StatusRequest.serverFailure
                ? Center(child: Lottie.asset(AppImages.server))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(AppImages.nodata))
                    : widget;
  }
}