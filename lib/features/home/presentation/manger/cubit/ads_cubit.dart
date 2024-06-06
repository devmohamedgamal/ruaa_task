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

  Future<void> getAds() async {
    emit(AdsLoading());
    var result = await homeRepoImpl.getAllAds();
    result.fold(
      (failure) {
        emit(AdsFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(AdsSuccess(adsList: success));
      },
    );
  }
}
