import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruaa_task/features/home/presentation/manger/cubit/ads_cubit.dart';
// Models
import '../../data/models/ads_model/ads_model.dart';
// Widgets
import 'ads_item_list_view.dart';

class AdsListView extends StatelessWidget {
  const AdsListView({
    super.key,
    required this.items,
  });
  final List<AdsModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent &&
              notification is ScrollUpdateNotification) {
            context.read<AdsCubit>().getAds(fromLoading: true);
          }
          return true;
        },
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: false,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AdsItemListView(item: items[index]),
              );
            }),
      ),
    );
  }
}
