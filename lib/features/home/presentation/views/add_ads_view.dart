import 'package:flutter/material.dart';
// Widgets
import '../widgets/add_ads_view_body.dart';

class AddAdsView extends StatelessWidget {
  const AddAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Ad'),
        centerTitle: true,
      ),
      body: const AddAdsViewBody(),
    );
  }
}
