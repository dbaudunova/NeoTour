import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/description/domain/model/review.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(review.avatar ?? ''),
            const SizedBox(width: 8),
            Text(
              review.name ?? '',
              style: AppStyles.s16w400.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          child: Text(
            review.review ?? '',
            style: AppStyles.s16w400,
          ),
        )
      ],
    );
  }
}
