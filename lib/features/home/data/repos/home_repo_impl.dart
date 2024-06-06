// Packages
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// constants
import 'package:ruaa_task/core/constants.dart';
// Errors
import 'package:ruaa_task/core/errors/failure.dart';
// Models
import 'package:ruaa_task/features/home/data/models/ads_model/ads_model.dart';
// Repos
import 'package:ruaa_task/features/home/data/repos/home_repo.dart';
// Utils (api)
import '../../../../core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<AdsModel>>> getAllAds() async {
    try {
      List<AdsModel> adsList = [];
      var data = await apiService.get(endPoint: AppConstants.adsEndpoint);

      for (var item in data['data']) {
        adsList.add(AdsModel.fromJson(item));
      }
      return right(adsList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
    }
  }
