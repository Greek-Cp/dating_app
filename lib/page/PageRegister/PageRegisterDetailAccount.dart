import 'dart:io';

import 'package:dating_app/page/PageLogin.dart';
import 'package:dating_app/page/PageRegister/PageChooseInterest.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import '../../component/ComponentButton.dart';
import '../../component/ComponentText.dart';
import '../../component/text_field.dart';
import '../../util/SizeApp.dart';

class PageRegisterDetailAccount extends StatefulWidget {
  static String? routeName = "/PageRegisterDetailAccount";

  @override
  State<PageRegisterDetailAccount> createState() =>
      _PageRegisterDetailAccountState();
}

class _PageRegisterDetailAccountState extends State<PageRegisterDetailAccount> {
  final textEditingControllerAboutYou = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final textEditingControllerJob = TextEditingController();
  File? _image;
  String? _namaFile;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        // Random random = Random();
        // String namaFileBaru = "profile${random.nextInt(1000)}";
        // String pathBaru =
        //     Path.join(Path.dirname(_image.toString()), namaFileBaru);
        _namaFile = Path.basename(_image.toString());
        // Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print("eror gambar :: ${e}");
      // Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeApp.SizePaddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  IconButton(
                      onPressed: () =>
                          {Get.toNamed(PageLogin.routeName.toString())},
                      icon: Icon(Icons.arrow_back)),
                  ComponentTextPrimaryTittleBold(
                    teks: "Detail \nInformasi",
                    size: SizeApp.SizeTextHeader.sp,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    child: TextFieldImport.TextFormNama(
                      text_kontrol: textEditingControllerAboutYou,
                      hintText: "Jelaskan Diri Anda",
                      labelName: "Tentang Anda",
                      pesanValidasi: "Detail Informasi",
                    ),
                  ),
                  SizedBox(
                    child: TextFieldImport.TextFormEmail(
                      text_kontrol: textEditingControllerJob,
                      hintText: "Pekerjaan Anda",
                      labelName: "Pekerjaan",
                      pesanValidasi: "Pekerjaan",
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ComponentButtonChoosePhotoProfile(
                    "Choose birthday date",
                    () {},
                    iconData: Icons.date_range_outlined,
                    colorButton: ColorApp.SecondaryButtonColorApp,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ComponentButtonChoosePhotoProfile(
                    "Choose photo profile",
                    () {},
                    iconData: Icons.person,
                    colorButton: ColorApp.SecondaryButtonColorApp,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                      child: CircleAvatar(
                    radius: 30,
                  )),
                  SizedBox(
                    height: 30.h,
                  ),
                  ComponentButtonPrimaryWithFunction(
                    "Register",
                    () {
                      Get.toNamed(PageChooseInterest.routeName.toString());
                      if (_formKey.currentState!.validate()) {
                      } else {}
                    },
                    sizeTextButton: SizeApp.SizeTextDescription.sp,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
