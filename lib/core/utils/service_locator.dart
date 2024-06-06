// Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// Repos
import '../../features/home/data/repos/home_repo_impl.dart';
// Api
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}
