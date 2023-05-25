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
  ComponentButtonPrimary(this.buttonName, this.func,
      {this.colorButton, this.sizeTextButton});
  @override
  Widget build(BuildContext context) {
    return _Button(context, func, buttonName);
  }

  Widget _Button(BuildContext context, Function? function, String? buttonName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: ElevatedButton(
        onPressed: () {
          function;
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
      ),
    );
  }
}
