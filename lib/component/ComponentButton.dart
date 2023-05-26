import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponentButtonPrimary extends StatelessWidget {
  String? buttonName;
  Function? func;
  Color? colorButton = ColorApp.PrimaryColor;
  double? sizeTextButton = SizeApp.SizeTextDescription;
  String? routeName;

  ComponentButtonPrimary(this.buttonName, this.func,
      {this.colorButton, this.sizeTextButton, this.routeName});
  @override
  Widget build(BuildContext context) {
    return _Button(context, func, buttonName);
  }

  Widget _Button(BuildContext context, Function? function, String? buttonName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(routeName.toString());
      },
      child: ComponentTextPrimaryTittleBold(
        teks: buttonName,
        size: sizeTextButton,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorApp.PrimaryColor,
          minimumSize: Size.fromHeight(55.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r))),
    );
  }
}

class ComponentButtonSecondary extends StatelessWidget {
  String? buttonName;
  Function? func;
  Color? colorButton = ColorApp.PrimaryColor;
  double? sizeTextButton = SizeApp.SizeTextDescription;
  String? routeName;

  ComponentButtonSecondary(this.buttonName, this.func,
      {this.colorButton, this.sizeTextButton, this.routeName});
  @override
  Widget build(BuildContext context) {
    return _Button(context, func, buttonName);
  }

  Widget _Button(BuildContext context, Function? function, String? buttonName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(routeName.toString());
      },
      child: ComponentTextPrimaryTittleBold(
        teks: buttonName,
        size: sizeTextButton,
        colorText: ColorApp.PrimaryColor,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: Size.fromHeight(55.h),
          side: BorderSide(color: Colors.grey, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          )),
    );
  }
}
