// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
// repos
import 'package:ruaa_task/features/home/data/repos/home_repo_impl.dart';
// Models
import '../../../data/models/ads_model/ads_model.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit(this.homeRepoImpl) : super(AdsInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> getAds({int page = 1, bool fromLoading = false}) async {
    if (fromLoading) {
      emit(GetMoreAdsLoading());
    } else {
      emit(GetAdsLoading());
    }
    var result = await homeRepoImpl.getAllAds();
    result.fold(
      (failure) {
        emit(GetAdsFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(GetAdsSuccess(adsList: success));
      },
    );
  }

  Future<void> addAds({required AdsModel item}) async {
    emit(AddAdsLoading());
    var result = await homeRepoImpl.addAd(item: item);
    result.fold(
      (failure) {
        emit(AddAdsFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(AddAdsSuccess(isSuccess: success));
      },
    );
  }
}
