import 'package:flutter/material.dart';
// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruaa_task/features/home/presentation/manger/cubit/ads_cubit.dart';

// Utils (Routers,Services)
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
// Repos
import 'features/home/data/repos/home_repo_impl.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdsCubit(
            getIt.get<HomeRepoImpl>(),
          )..getAds(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Task',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
