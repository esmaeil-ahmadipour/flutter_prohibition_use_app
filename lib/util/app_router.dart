import 'package:flutter_prohibition_use_app/ui/home.dart';
import 'package:flutter_prohibition_use_app/util/constants.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: rootScreenRoute,
  routes: [
    rootRoute
  ],
);

final rootRoute = GoRoute(
  path: rootScreenRoute,
  builder: (context, state) => const HomePage(),
);
