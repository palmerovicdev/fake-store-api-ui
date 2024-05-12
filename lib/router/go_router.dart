import 'package:fake_store_api_ui/features/home/presentation/pages/home_page.dart';
import 'package:fake_store_api_ui/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.home.path,
  routes: [
    GoRoute(
      path: Routes.home.path,
      name: Routes.home.name,
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
    ),
    GoRoute(
      path: Routes.docs.path,
      name: Routes.docs.name,
      pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
    ),
  ],
);