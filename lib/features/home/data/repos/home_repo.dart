// Packages
import 'package:dartz/dartz.dart';

// Models
import 'package:ruaa_task/features/home/data/models/ads_model/ads_model.dart';

// Errors
import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<AdsModel>>> getAllAds();
  Future<Either<Failure, bool>> addAllAds({
    required AdsModel item,
  });
}
