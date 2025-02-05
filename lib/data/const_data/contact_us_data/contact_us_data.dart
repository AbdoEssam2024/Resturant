import 'package:flutter/material.dart';
import 'package:resturant_anj/core/constant/images/app_images.dart';
import '../../../model/contact_us_model/contact_us_model.dart';
import '../../../view/screens/contact_us/widgets/drop_down_text.dart';

List<ContactUsModel> contactUsList = [
  ContactUsModel(
      image: AppImages.customerService,
      label: "Customer Service",
      dropDownWidgets: [
        DropdownMenuEntry(
            value: "",
            label: "",
            labelWidget: DropDownText(text: "01143191380")),
      ]),
  ContactUsModel(image: AppImages.website, label: "Web Site", dropDownWidgets: [
    DropdownMenuEntry(
      value: "",
      label: "",
      labelWidget: DropDownText(text: "https://www.abdoessam.com"),
    ),
  ]),
  ContactUsModel(
      image: AppImages.whatsapp,
      label: "Whats App",
      dropDownWidgets: [
        DropdownMenuEntry(
            labelWidget: DropDownText(text: "01008994398"),
            value: "",
            label: ""),
      ]),
  ContactUsModel(
      image: AppImages.facebook,
      label: "Facebook",
      dropDownWidgets: [
        DropdownMenuEntry(
          value: "",
          label: "",
          labelWidget: DropDownText(text: "https://www.abdoessam.com"),
        ),
      ]),
  ContactUsModel(
      image: AppImages.instagram,
      label: "Instagram",
      dropDownWidgets: [
        DropdownMenuEntry(
            labelWidget: DropDownText(text: "https://www.abdoessam.com"),
            value: "",
            label: ""),
      ]),
];