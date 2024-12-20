import 'package:go_router/go_router.dart';
import 'presentation/home.dart';

final homeRoutes = [
  GoRoute(
    path: "/home",
    builder: (context, state) => const Home(),
  )
];
