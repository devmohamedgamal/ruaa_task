part of 'ads_cubit.dart';

@immutable
sealed class AdsState {}

final class AdsInitial extends AdsState {}

final class AdsLoading extends AdsState {}

final class AdsFailure extends AdsState {
  final String errMessage;

  AdsFailure({required this.errMessage});
}

final class AdsSuccess extends AdsState {
  final List<AdsModel> adsList;
  AdsSuccess({required this.adsList});
}
