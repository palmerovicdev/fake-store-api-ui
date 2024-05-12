import 'package:flutter/material.dart';

class TittleText extends StatelessWidget {
  const TittleText({
    super.key,
    required this.text,
    this.size,
    this.textAlign,
    this.fontFamily,
  });

  final String text;
  final double? size;
  final TextAlign? textAlign;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w900,
            fontFamily: fontFamily ?? 'Anton',
            fontSize: size ?? 56,
          ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}