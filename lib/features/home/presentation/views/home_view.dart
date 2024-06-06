import 'package:flutter/material.dart';

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
      body: const HomeViewBody(),
    );
  }
}
