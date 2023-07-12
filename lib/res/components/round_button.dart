import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {required this.title,
      required this.onPress,
      Key? key,
      this.buttonColor = AppColor.primaryButtonColor,
      this.textColor = AppColor.primaryTextColor,
      this.width = 60,
      this.height = 50,
      this.loading = false})
      : super(key: key);

  final bool loading;
  final String title;
  final double height;
  final double width;
  final VoidCallback onPress;
  final Color textColor;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
