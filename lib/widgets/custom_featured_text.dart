import 'package:flutter/material.dart';

class CustomFeaturedText extends StatelessWidget {
  const CustomFeaturedText({
    super.key,
    required this.smallTittle,
  });

  final String? smallTittle;

  @override
  Widget build(BuildContext context) {
    return Text(
      smallTittle!,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'ShadowsIntoLight',
      )
    );
  }
}