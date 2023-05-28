import 'package:dating_app/component/ComponentButton.dart';
import 'package:dating_app/component/ComponentText.dart';
import 'package:dating_app/component/Toast.dart';
import 'package:dating_app/component/text_field.dart';
import 'package:dating_app/page/PageLogin.dart';
import 'package:dating_app/page/PageRegister/PageRegisterDetailAccount.dart';
import 'package:dating_app/util/ColorApp.dart';
import 'package:dating_app/util/SizeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PageRegister extends StatefulWidget {
  static String? RouteName = "/PageRegister";
  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final _formKey = GlobalKey<FormState>();

  final textEditingControllerNama = TextEditingController();

  final textEditingControllerEmail = TextEditingController();

  final textEditingControllerNomorHP = TextEditingController();

  final textEditingControllerPassword = TextEditingController();

  final textEditingControllerKonfirmasiPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(
        builder: (context, child) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeApp.SizePaddingHorizontal.h),
              child: SingleChildScrollView(
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
                      teks: "Register",
                      size: SizeApp.SizeTextHeader.sp,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      child: TextFieldImport.TextFormNama(
                        text_kontrol: textEditingControllerNama,
                        hintText: "Masukkan Nama",
                        labelName: "Nama",
                        pesanValidasi: "Nama",
                      ),
                    ),

                    SizedBox(
                      child: TextFieldImport.TextFormEmail(
                        text_kontrol: textEditingControllerEmail,
                        hintText: "Masukkan Email",
                        labelName: "Email",
                        pesanValidasi: "Email",
                      ),
                    ),

                    SizedBox(
                      child: TextFieldImport.TextForm(
                        text_kontrol: textEditingControllerNomorHP,
                        hintText: "Masukkan Nomor HP",
                        labelName: "Nomor HP",
                        pesanValidasi: "Nomor HP",
                      ),
                    ),
                    SizedBox(
                        child: TextFieldPassword(
                            textEditingControllerPassword,
                            "terdiri : huruf besar , angka dan min 7 karakter",
                            false,
                            "Kata Sandi",
                            "Kata Sandi")),
                    // SizedBox(
                    //     child: TextFieldPassword(
                    //         textEditingControllerKonfirmasiPassword,
                    //         "Masukkan Ulang Sandi",
                    //         false,
                    //         "Ulangi Kata Sandi",
                    //         "Kata Sandi")),
                    SizedBox(
                      child: PasswordDone(
                          hintText: "Masukkan Ulang Sandi",
                          passwordType: _obsecureText,
                          labelName: "Ulangi kata Sandi",
                          pesanValidasi: "Kata Sandi",
                          text_kontrol:
                              textEditingControllerKonfirmasiPassword),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),
                    ComponentButtonPrimaryWithFunction(
                      "Continue",
                      () {
                        Get.toNamed(
                            PageRegisterDetailAccount.routeName.toString());
                        if (_formKey.currentState!.validate()) {
                        } else {}
                      },
                      sizeTextButton: SizeApp.SizeTextDescription.sp,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool _obsecureText = false;

  void _getVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  Widget PasswordDone(
      {TextEditingController? text_kontrol,
      String? hintText,
      bool? passwordType,
      String? labelName,
      String? pesanValidasi}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          "${labelName}",
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp)),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty || value == null) {
              return "${pesanValidasi} Tidak Boleh Kosong";
            }
            if (value.length < 7) {
              return 'Password minimal terdiri dari 7 karakter';
            }
            final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{7,}$');
            if (!regex.hasMatch(value)) {
              return 'Password harus mengandung huruf besar dan angka';
            }
            return null;
          },
          obscureText: !passwordType!,
          controller: text_kontrol,
          onFieldSubmitted: (value) async {
            if (_formKey.currentState!.validate()) {
              if (textEditingControllerEmail.text.toString().length != 16) {
                ToastWidget.ToastEror(
                    context, "Email Tidak Boleh Kosong", "Teliti Lagi!");
              } else if (textEditingControllerNomorHP.text.toString().length <
                  11) {
                ToastWidget.ToastEror(
                    context, "Nomer Telp harus 12 karakter", "Teliti Lagi");
              } else if (textEditingControllerKonfirmasiPassword.text
                      .toString() !=
                  textEditingControllerPassword.text.toString()) {
                ToastWidget.ToastEror(
                    context, "Katasandi Tidak Sama", "Periksa Kembali");
              } else {
                // setState(() {
                //   _isLoading = true;
                //   print("awal == ${_isLoading}");
                // });
                // HttpStatefull.registerAkun(
                //         email: textEditingControllerEmail.text,
                //         password: textEditingControllerPassword.text,
                //         username: textEditingControllerUsername.text,
                //         nomor_telepon: textEditingControllerNomorTelepon.text,
                //         kode_otp: otp_register.toString(),
                //         nama_lengkap:
                //             textEditingControllerNama.text.toString(),
                //         nik: textEditingControllerNik.text)
                //     .then((value) => {
                //           if (value.code == 200)
                //             {
                //               this.sendMail(
                //                   otp_register.toString(),
                //                   textEditingControllerEmail.text.toString(),
                //                   context),
                //             }
                //           else
                //             {
                //               setState(() {
                //                 _isLoading = false;
                //                 print("akhir == ${_isLoading}");
                //               }),
                //               ToastWidget.ToastEror(
                //                   context,
                //                   "Daftar Gagal Akun Telah Ada",
                //                   "Teliti Lagi")
                //             }
                //         });
              }
            } else {}
          },
          textInputAction: TextInputAction.done,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    // setState(() {
                    //   passwordType = !passwordType!;
                    // });
                    _getVisibility();
                  },
                  icon: Icon(
                    passwordType! ? Icons.visibility : Icons.visibility_off,
                    color: ColorApp.PrimaryColor,
                  )),
              hintText: hintText,
              contentPadding: EdgeInsets.all(15),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: ColorApp.PrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: ColorApp.PrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: ColorApp.PrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ],
    );
  }
}
