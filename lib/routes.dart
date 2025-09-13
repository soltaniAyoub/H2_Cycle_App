import 'package:go_router/go_router.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/main_page.dart'; 
import 'pages/home_page.dart';
import 'pages/recycle_page.dart';
import 'pages/map_page.dart';
import 'pages/rewards_page.dart';
import 'pages/profile_page.dart';
import 'pages/wallet_page.dart';
import 'pages/edit_profile_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // 🔑 Auth pages (no navbar)
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (_, __) => const RegisterPage(),
    ),

    // 🏠 Main app pages (with navbar)
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child); // MainPage holds the BottomNavigationBar
      },
      routes: [
        GoRoute(
          path: '/main/home',
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
          path: '/main/map',
          builder: (_, __) => const MapPage(),
        ),
        GoRoute(
          path: '/main/recycle',
          builder: (_, __) => const RecyclePage(),
        ),
        GoRoute(
          path: '/main/rewards',
          builder: (_, __) => const RewardsPage(),
        ),
        GoRoute(
          path: '/main/profile',
          builder: (_, __) => const ProfilePage(),
        ),
      ],
    ),

    // ⚙️ Standalone pages (opened from inside profile/wallet etc.)
    GoRoute(
      path: '/wallet',
      builder: (_, __) => const WalletPage(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (_, __) => const EditProfilePage(),
    ),
  ],
);
