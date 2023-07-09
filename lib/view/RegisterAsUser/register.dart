import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../components/elevated_button_widget.dart';
import '../../components/social_elevated_button_widget.dart';
import '../../components/text_filed_widget.dart';
import '../../components/text_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  void _register() {
    final String phone = _phoneController.text;
    final String referral = _referralController.text;

    if (phone.isEmpty || referral.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    _phoneController.clear();
    _referralController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('referral successful.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
                    image: const AssetImage('assets/image/Logo.png'),
                    height: height / 29.480,
                    width: width / 2.805),
                SizedBox(
                  height: height / 17.196,
                ),
                IntlPhoneField(
                  textInputAction: TextInputAction.next,
                  controller: _phoneController,
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
                  initialCountryCode: 'ps',
                  onChanged: (PhoneNumber phone) {
                    // print(phone.completeNumber);
                  },
                ),
                SizedBox(
                  height: height / 51.590,
                ),
                TextFieldWidget(
                  textInputAction: TextInputAction.send,
                  nameController: _referralController,
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
                    onPressed: _register, text: 'Login/Sign up'),
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
                    image: AssetImage('assets/image/image 32.png'),
                  ),
                ),
                SizedBox(
                  height: height / 51.590,
                ),
                SocialElevatedButtonWidget(
                  onPressed: () {},
                  text: 'Continue with Facebook',
                  image: const Image(
                    image: AssetImage('assets/image/image 33.png'),
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
