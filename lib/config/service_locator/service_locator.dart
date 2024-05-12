import 'package:get_it/get_it.dart';

import '../../theme/presentation/bloc/theme_selector_cubit.dart';
final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  setupBlocks();
}

setupBlocks() {
  serviceLocator.registerSingleton(ThemeSelectorCubit());
}