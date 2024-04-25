import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/description/domain/model/tour.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.tourEntity,
  });

  final ReviewDtoList tourEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CachedNetworkImage(
                imageUrl: tourEntity.imageUrl ?? '',
              ),
            ),
            const SizedBox(width: 8),
            Text(
              tourEntity.authorNickname ?? '',
              style: AppStyles.s16w400.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: Text(
            tourEntity.text ?? '',
            style: AppStyles.s16w400,
          ),
        )
      ],
    );
  }
}

