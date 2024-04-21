// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:clap_board/utils/colors.dart';
import 'package:clap_board/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;
  final bool isLoading;

  const CustomButton({
    super.key,
    this.color = AppColors.blue,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      // onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        width: double.infinity,
        height: Dimensions.height30 * 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: isLoading
            ? LoadingAnimationWidget.flickr(
                rightDotColor: Color.fromARGB(70, 255, 255, 255),
                leftDotColor: Color.fromARGB(255, 255, 255, 255),
                size: 30)
            : FittedBox(
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'SF',
                      color: Colors.white,
                      fontSize: Dimensions.font22,
                      fontWeight: FontWeight.w400),
                ),
              ),
      ),
    );
  }
}
