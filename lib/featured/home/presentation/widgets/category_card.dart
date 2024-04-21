import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/home/domain/model/place.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({
    super.key,
    required this.place,
    required this.radius,
    required this.contentPadding,
    required this.textSize,
    required this.onTap,
  });

  final Place place;
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
              image: AssetImage(place.imagePath ?? ''),
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
                  place.name ?? '',
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
