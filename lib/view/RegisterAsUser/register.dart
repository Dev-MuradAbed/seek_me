import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../companait/elevated_button_widget.dart';
import '../../companait/social_elevated_button_widget.dart';
import '../../companait/text_filed_widget.dart';
import '../../companait/text_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _referralController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  void _register() {
    // Perform registration logic here
    String phone = _phoneController.text;
    String referral = _referralController.text;

    // Validate the input fields
    if (phone.isEmpty || referral.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Perform registration logic with the provided data
    // ...

    // Clear the input fields
    _phoneController.clear();
    _referralController.clear();

    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('referral successful.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/image/Logo.png'),height: 28,width: 140),
            SizedBox(height: 48,),
            IntlPhoneField(
              controller: _phoneController,
              disableLengthCheck: true,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle:TextStyle(color: Color(0xFF79747E)) ,
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              initialCountryCode: 'ps',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            SizedBox(height: 16,),
            TextFieldWidget(nameController: _referralController,hintText: 'Referral code (Optional)'),
            ],
        ),
      ),
    );
  }
}


