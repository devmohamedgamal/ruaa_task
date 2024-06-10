// Packages
import 'dart:convert';
import 'dart:developer';
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
  Future<Either<Failure, bool>> addAd({required AdsModel item}) async {
    try {
      var data = FormData.fromMap({
        'first_image': await MultipartFile.fromFile(
          item.firstImage!,
          filename: item.firstImage,
        ),
        'images[]': [
          await MultipartFile.fromFile(
            item.firstImage!,
            filename: item.firstImage,
          ),
        ],
        'name': item.name,
        'desc': item.desc,
        'price': item.price,
      });
      var response = await apiService.post(
        data: data,
      );

      if (response['status'] == true) {
        log('Add Ad Success \n $response');
        return right(true);
      } else {
        log('Else Error \n $data status code = $response');
        return left(ServerFailure('errMessage'));
      }
    } on DioException catch (e) {
      log(e.message!);
      return left(ServerFailure(e.message.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
