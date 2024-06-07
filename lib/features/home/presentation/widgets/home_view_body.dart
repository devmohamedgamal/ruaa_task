import 'package:flutter/material.dart';
// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
// Cubits
import 'package:ruaa_task/features/home/presentation/manger/cubit/ads_cubit.dart';
// Widgets
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import 'ads_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsCubit, AdsState>(
      buildWhen: (context,current) => current is! GetMoreAdsLoading,
      builder: (context, state) {
        if (state is GetAdsLoading) {
          return const CustomLoadingIndecator();
        } else if (state is GetAdsSuccess) {
          return AdsListView(
            items: state.adsList,
          );
        } else if (state is GetAdsFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const Center(
            child: Text('Unexpected Error'),
          );
        }
      },
    );
  }
}
