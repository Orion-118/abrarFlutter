import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String? buttonText;
  final double? width;
  final double? height;
  final List<MaterialColor> colors;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  final double? textFontSize;
  final double borderWidth;

  const CustomGradientButton({super.key, this.buttonText,
    this.width,
    this.height,
    required this.colors,
    this.borderRadius,
    this.onPressed,
    this.textFontSize = 16,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
          border: Border.all(
            color: Colors.white,
            width: borderWidth,
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius!,
            ),
          ),
          child: Text(
            '$buttonText',
            style: TextStyle(
              color: Colors.white,
              fontSize: textFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
