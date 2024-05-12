import 'package:flutter/material.dart';

class TittleText extends StatelessWidget {
  const TittleText({
    super.key,
    required this.text,
    this.size,
  });

  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w900,
            fontFamily: 'Anton',
            fontSize: size?? 56,
          ),
      textAlign: TextAlign.center,
    );
  }
}