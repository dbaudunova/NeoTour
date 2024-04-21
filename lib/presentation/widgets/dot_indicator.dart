import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/data/model/place.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required int currentItem,
    required List<Place> places,
  })  : _currentItem = currentItem,
        _places = places;

  final int _currentItem;
  final List<Place> _places;

  @override
  Widget build(BuildContext context) {
    return PageViewDotIndicator(
      boxShape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(3),
      currentItem: _currentItem,
      size: const Size(23, 6),
      unselectedSize: const Size(6, 6),
      count: _places.length,
      unselectedColor: AppColors.unDot,
      selectedColor: AppColors.primaryColor,
    );
  }
}
