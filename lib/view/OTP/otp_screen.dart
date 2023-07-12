import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../view_models/controller/OTP/OTP_view_model.dart';
import 'components/index.dart';

class OTPScreen extends StatelessWidget {
   OTPScreen({Key? key}) : super(key: key);
  final OtpViewModel otpVM =Get.put(OtpViewModel());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: height / 10.190,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 120,
            ),
            const Text('We have sent you a 4 digit verification code on',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const TextWidget(hintText: '+970599084404'),
            SizedBox(
              height: height / 16,
            ),
            Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpVM.otpController0.value,
                        onSaved: (String? pin1) {},
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          hintText: '0',
                          hintStyle: const TextStyle(
                            color: Color(0xFF79747E),
                          ),
                        ),
                        onChanged: (String value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpVM.otpController1.value,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          hintText: '0',
                          hintStyle: const TextStyle(
                            color: Color(0xFF79747E),
                          ),
                        ),
                        onChanged: (String value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }else{
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpVM.otpController2.value,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          hintText: '0',
                          hintStyle: const TextStyle(
                            color: Color(0xFF79747E),
                          ),
                        ),
                        onChanged: (String value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }else{
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpVM.otpController3.value,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              height / 68.787,
                            ),
                          ),
                          hintText: '0',
                          hintStyle: const TextStyle(
                            color: Color(0xFF79747E),
                          ),
                        ),
                        onChanged: (String value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }else{
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: height / 10,
            ),
            ElevatedButtonWidget(
              onPressed: () =>otpVM.verifyOtp(),
              text: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
