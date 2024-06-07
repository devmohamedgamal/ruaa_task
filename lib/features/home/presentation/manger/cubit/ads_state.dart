part of 'ads_cubit.dart';

@immutable
sealed class AdsState {}

final class AdsInitial extends AdsState {}

final class GetAdsLoading extends AdsState {}

final class GetAdsFailure extends AdsState {
  final String errMessage;

  GetAdsFailure({required this.errMessage});
}

final class GetAdsSuccess extends AdsState {
  final List<AdsModel> adsList;
  GetAdsSuccess({required this.adsList});
}

final class GetMoreAdsLoading extends AdsState {}


final class AddAdsLoading extends AdsState {}

final class AddAdsFailure extends AdsState {
  final String errMessage;

  AddAdsFailure({required this.errMessage});
}

final class AddAdsSuccess extends AdsState {
  final bool isSuccess;

  AddAdsSuccess({required this.isSuccess});
}



