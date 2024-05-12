import 'package:fake_store_api_ui/theme/presentation/bloc/theme_selector_cubit.dart';
import 'package:fake_store_api_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/service_locator/service_locator.dart';
import 'router/go_router.dart';

void main() {
  setupServiceLocator();
  runApp(const FakeStoreApiUI());
}

class FakeStoreApiUI extends StatelessWidget {
  const FakeStoreApiUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeSelectorCubit>(
          create: (_) => serviceLocator.get<ThemeSelectorCubit>(),
        ),
      ],
      child: const FakeStoreInitialUI(),
    );
  }
}

class FakeStoreInitialUI extends StatelessWidget {
  const FakeStoreInitialUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSelectorCubit, ThemeSelectorState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          themeMode: (state as ThemeSelectorInitial).themeMode,
          theme: CustomTheme(
            colorSeed: state.colorSeed,
            brightness: state.themeMode == ThemeMode.light
                ? Brightness.light
                : Brightness.dark,
          ).theme,
          darkTheme: CustomTheme(
            colorSeed: state.colorSeed,
            brightness: Brightness.dark,
          ).theme,
          routerConfig: router,
        );
      },
    );
  }
}