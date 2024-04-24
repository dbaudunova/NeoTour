import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/home/presentation/widgets/circle_tab_indicator.dart';

class TabBarStyle extends StatelessWidget {
  const TabBarStyle({
    super.key,
    required List<Tab> tabs, required this.onTap,
  }) : _tabs = tabs;

  final List<Tab> _tabs;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      isScrollable: true,
      padding: const EdgeInsets.only(right: 16),
      dividerColor: Colors.transparent,
      unselectedLabelStyle: AppStyles.s16w400,
      labelStyle: AppStyles.s16w700,
      indicator: CircleTabIndicator(
        color: AppColors.primaryColor,
        radius: 4,
      ),
      tabs: _tabs,
    );
  }
}
