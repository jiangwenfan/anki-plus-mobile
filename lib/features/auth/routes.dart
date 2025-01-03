import 'package:go_router/go_router.dart';
import 'presentation/login_home.dart';

final authRoutes = [
  GoRoute(
    path: "/login_home",
    builder: (context, state) => const LoginHome(),
  )
];
