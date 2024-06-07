import 'package:flutter/material.dart';

// Models
import '../../../../core/constants.dart';
import '../../data/models/ads_model/ads_model.dart';

class AdsItemListView extends StatelessWidget {
  const AdsItemListView({super.key, required this.item});
  final AdsModel? item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.purple.withOpacity(.2),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              item?.firstImage ?? AppConstants.networkNotFoundImage,
              errorBuilder: (context, object, stack) {
                return Image.asset(AppConstants.assetsNotFoundImage);
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(item?.name ?? 'Name'),
                const Spacer(),
                Text("\$${item?.price ?? r'$00'}"),
              ],
            ),
          ),
          Text(item?.desc ?? 'description'),
        ],
      ),
    );
  }
}
