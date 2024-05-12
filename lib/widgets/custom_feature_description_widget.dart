import 'package:flutter/material.dart';

class CustomFeatureDescriptionWidget extends StatelessWidget {
  const CustomFeatureDescriptionWidget({
    super.key,
    this.smallTittle,
    required this.tittle,
    required this.description,
    this.features,
    this.maxWidth,
  });

  final String? smallTittle;
  final String tittle;
  final String description;
  final List<String>? features;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth ?? 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (smallTittle != null)
            Text(
              smallTittle!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'ShadowsIntoLight',
              )
            ),
          const SizedBox(height: 6),
          Text(
            tittle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                  fontSize: 16,
                ),
          ),
          if (features != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features!
                  .map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            feature,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
                                  fontSize: 16,
                                ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}