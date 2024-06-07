import 'package:flutter/material.dart';
// Packages
import 'package:flutter_bloc/flutter_bloc.dart';
// Cubits
import 'package:ruaa_task/features/home/presentation/manger/cubit/ads_cubit.dart';
// Widgets
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ads'),
        centerTitle: true,
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BlocBuilder<AdsCubit, AdsState>(
          builder: (context, state) {
            if (state is GetMoreAdsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
