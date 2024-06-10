// Packages
import 'package:go_router/go_router.dart';
// Views
import 'package:ruaa_task/features/home/presentation/views/home_view.dart';
import 'package:ruaa_task/features/home/presentation/views/add_ads_view.dart';

abstract class AppRouter {
  static const String addAdView = '/addAddView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: addAdView,
      builder: (context, state) => const AddAdsView(),
    ),
  ]);
}
