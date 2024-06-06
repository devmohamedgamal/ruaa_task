import 'package:flutter/material.dart';
// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
// Cubits
import 'package:ruaa_task/features/home/presentation/manger/cubit/ads_cubit.dart';
// Widgets
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indecator.dart';
import 'ads_item_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsCubit, AdsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AdsLoading) {
          return const CustomLoadingIndecator();
        } else if (state is AdsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ListView.builder(
                itemCount: state.adsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: AdsItemListView(item: state.adsList[index]),
                  );
                }),
          );
        } else if (state is AdsFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const Center(
            child: Text('Else Error'),
          );
        }
      },
    );
  }
}
