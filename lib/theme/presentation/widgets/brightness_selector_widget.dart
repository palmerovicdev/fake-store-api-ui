import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_selector_cubit.dart';

class BrightnessSelectorWidget extends StatelessWidget {
  const BrightnessSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.light_mode),
          iconSize: 28,
          onPressed: () {
            context.read<ThemeSelectorCubit>().changeTheme(ThemeMode.light);
          },
        ),
        IconButton(
          icon: const Icon(Icons.dark_mode),
          iconSize: 28,
          onPressed: () {
            context.read<ThemeSelectorCubit>().changeTheme(ThemeMode.dark);
          },
        ),
      ],
    );
  }
}