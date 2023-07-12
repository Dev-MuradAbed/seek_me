import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../index.dart';
import '../../../view/OTP/components/index.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterViewModel registerVM = Get.put(RegisterViewModel());
  // void _register() {
  //   final String phone = registerVM.phoneController.value.text;
  //   // final String mobileCode = registerVM.mobileCodeController.value.text;
  //
  //   if (phone.isEmpty) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Error'),
  //           content: const Text('Please fill in all fields.'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //     return;
  //   }
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) {
  //     registerVM.registerApi();
  //     return OTPScreen();
  //   },
  //   ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(height / 51.59),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: height / 10.190),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: const AssetImage(ImageAssets.logoImage),
                    height: height / 29.480,
                    width: width / 2.805),
                SizedBox(
                  height: height / 17.196,
                ),
                IntlPhoneField(
                  textInputAction: TextInputAction.next,
                  disableLengthCheck: true,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(
                      color: Color(
                        0xFF79747E,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(
                        height / 68.787,
                      ),
                    ),
                  ),
                  initialCountryCode: 'SR',
                  onCountryChanged: (Country code) {
                    registerVM.mobileCodeController.value.text = code.dialCode;
                  },
                  onChanged: (PhoneNumber phone) {
                    registerVM.phoneController.value.text =
                        phone.completeNumber.tr;
                  },
                ),
                SizedBox(
                  height: height / 51.590,
                ),
                const TextFieldWidget(
                  textInputAction: TextInputAction.send,
                  // nameController: registerVM.mobileCodeController.value,
                  hintText: 'Referral code (Optional)',
                ),
                SizedBox(
                  height: height / 51.590,
                ),
                const TextWidget(
                    hintText:
                        'An OTP will be sent on given phone number for verification.Standard message and data rates apply.'),
                SizedBox(
                  height: height / 34.393,
                ),
                ElevatedButtonWidget(
                    onPressed: registerVM.registerApi, text: 'Login/Sign up'),
                SizedBox(
                  height: height / 24.278,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Expanded(
                        child: Divider(color: Color(0xFF757575), thickness: 1)),
                    SizedBox(
                      width: width / 39.272,
                    ),
                    const Text('OR'),
                    SizedBox(
                      width: width / 39.272,
                    ),
                    const Expanded(
                        child: Divider(color: Color(0xFF757575), thickness: 1))
                  ],
                ),
                SizedBox(
                  height: height / 26.627,
                ),
                SocialElevatedButtonWidget(
                  onPressed: () {},
                  text: 'Continue with Google',
                  image: const Image(
                    image: AssetImage(ImageAssets.googleImage),
                  ),
                ),
                SizedBox(
                  height: height / 51.590,
                ),
                SocialElevatedButtonWidget(
                  onPressed: () {},
                  text: 'Continue with Facebook',
                  image: const Image(
                    image: AssetImage(ImageAssets.facebookImage),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
