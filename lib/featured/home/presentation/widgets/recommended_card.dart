import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';

class RecommendedCardItem extends StatelessWidget {
  const RecommendedCardItem({
    super.key,
    required this.recommended,
    required this.radius,
    required this.contentPadding,
    required this.textSize,
    required this.onTap,
  });

  final RecommendedEntity recommended;
  final double radius;
  final double textSize;
  final EdgeInsets contentPadding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Container(
          width: 335,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              image: CachedNetworkImageProvider(recommended.imageUrl ?? ''),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: contentPadding,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  ),
                ),
                child: Text(
                  recommended.name ?? '',
                  style: AppStyles.s20w600.copyWith(fontSize: textSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
