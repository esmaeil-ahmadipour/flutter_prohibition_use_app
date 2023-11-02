import 'package:flutter_prohibition_use_app/ui/screens/fail_screen.dart';
import 'package:flutter_prohibition_use_app/ui/screens/home.dart';
import 'package:flutter_prohibition_use_app/ui/screens/succeed_screen.dart';
import 'package:flutter_prohibition_use_app/util/constants.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: rootScreenRoute,
  routes: [
    rootRoute,
    succeedRoute,
    failRoute,
  ],
);

final rootRoute = GoRoute(
  path: rootScreenRoute,
  builder: (context, state) => const HomePage(),
);

final succeedRoute = GoRoute(
  name: succeedScreenRoute,
  path: succeedScreenRoute,
  builder: (context, state) => const SucceedScreen(),
);

final failRoute = GoRoute(
  name: failScreenRoute,
  path: failScreenRoute,
  builder: (context, state) => const FailScreen(),
);
