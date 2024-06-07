// Packages
import 'dart:convert';
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

  List<AdsModel> adsList = [];
  int pageNumber = 1;

  @override
  Future<Either<Failure, List<AdsModel>>> getAllAds() async {
    try {
      var data = await apiService.get(
          endPoint: AppConstants.adsEndpoint, page: pageNumber);

      if (data['data'] != null) {
        for (var item in data['data']) {
          adsList.add(AdsModel.fromJson(item));
        }
        pageNumber++;
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

  @override
  Future<Either<Failure, bool>> addAllAds({required AdsModel item}) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      "Accept ": " application/json"
    };
    var data = json.encode({
      "name": item.name,
      "desc": item.desc,
      "price": item.price,
      "created_at": DateTime.now().toString(),
      'first_image': item.firstImage,
      'images': item.images,
    });
    var dio = Dio();
    try {
      var response = await dio.request(
        AppConstants.adsEndpoint,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(response.data);
      } else {
        return left(ServerFailure(response.statusMessage.toString()));
      }
    } on DioException catch (e) {
      return left(ServerFailure(e.message.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
