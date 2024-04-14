import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/data/model/place.dart';
import 'package:neo_tour/presentation/widgets/category_card.dart';
import 'package:neo_tour/presentation/widgets/circle_tab_indicator.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Tab> _tabs = [
    'Popular',
    'Featured',
    'Most Visited',
    'Europe',
    'Asia',
  ].map((title) => Tab(text: title)).toList();

  final _places = [
    Place(id: 0, name: 'Nothern Mountain', imagePath: AppAssets.mountain),
    Place(id: 1, name: 'Nothern Mountain', imagePath: AppAssets.mountain),
    Place(id: 2, name: 'Nothern Mountain', imagePath: AppAssets.mountain),
    Place(id: 3, name: 'Nothern Mountain', imagePath: AppAssets.mountain),
    Place(id: 4, name: 'Nothern Mountain', imagePath: AppAssets.mountain),
    Place(id: 5, name: 'Nothern Mountain', imagePath: AppAssets.mountain),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 48),
              child: Text(
                'Discover',
                style: AppStyles.s36w900.copyWith(
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DefaultTabController(
                length: _tabs.length,
                child: Column(
                  children: [
                    _buildTabBar(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16),
              child: SizedBox(
                height: 254,
                child: ListView.builder(
                  itemCount: _places.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _categoryCardItemBuilder,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 16),
              child: Text(
                'Recommended',
                style: AppStyles.s20w600.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
                child: GridView.builder(
                  itemCount: _places.length,
                  itemBuilder: _recommendedItemBuilder,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget? _categoryCardItemBuilder(context, index) {
    return CategoryCardItem(
      place: _places.elementAt(index),
      radius: 19,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      textSize: 20,
    );
  }

  Widget? _recommendedItemBuilder(context, index) {
    return CategoryCardItem(
      place: _places.elementAt(index),
      radius: 10,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      textSize: 14,
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      isScrollable: true,
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
