import 'package:go_router/go_router.dart';
import 'package:remind/features/auth/presentation/pages/login_page.dart';
import 'package:remind/features/auth/presentation/pages/signup_page.dart';
import 'package:remind/features/home/presentation/pages/home_page.dart';
import 'package:remind/features/reminders/presentation/pages/create_reminder_page.dart';
import 'package:remind/features/reminders/presentation/pages/reminder_detail_page.dart';
import 'package:remind/features/profile/presentation/pages/profile_page.dart';
import 'package:remind/features/settings/presentation/pages/settings_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/create-reminder',
        name: 'create-reminder',
        builder: (context, state) {
          final type = state.uri.queryParameters['type'] ?? 'time';
          return CreateReminderPage(reminderType: type);
        },
      ),
      GoRoute(
        path: '/reminder/:id',
        name: 'reminder-detail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return ReminderDetailPage(reminderId: id);
        },
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}

