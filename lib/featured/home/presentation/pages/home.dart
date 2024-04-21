import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/home/domain/model/place.dart';
import 'package:neo_tour/featured/description/presentation/pages/description.dart';
import 'package:neo_tour/featured/home/presentation/bloc/recommended/recommended_bloc.dart';
import 'package:neo_tour/featured/home/presentation/widgets/category_card.dart';
import 'package:neo_tour/featured/home/presentation/widgets/dot_indicator.dart';
import 'package:neo_tour/featured/home/presentation/widgets/recommended_card.dart';
import 'package:neo_tour/featured/home/presentation/widgets/tab_bar_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  int _currentItem = 0;
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
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    BlocProvider.of<RecommendedBloc>(context).add(GetRecommendedTours());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    const double itemExtent = 254;
    final double offset = _scrollController.offset;
    final int currentItem = (offset / itemExtent).floor();

    if (currentItem >= 0 && currentItem < _places.length) {
      setState(() {
        _currentItem = currentItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TabBarStyle(tabs: _tabs),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: SizedBox(
                  height: 254,
                  child: ListView.builder(
                    itemCount: _places.length,
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: _categoryCardItemBuilder,
                    controller: _scrollController,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DotIndicator(currentItem: _currentItem, places: _places),
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
              BlocBuilder<RecommendedBloc, RecommendedState>(
                builder: (context, state) {
                  if (state is RecommendedLoading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is RecommendedError) {
                    return Center(
                      child: Text(
                        'Something went wrong',
                        style: AppStyles.s24w900,
                      ),
                    );
                  }
                  if (state is RecommendedDone) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 16, right: 16),
                      child: _buildGridView(state),
                    );
                  } else {
                    return Text(
                      'Oops',
                      style: AppStyles.s24w900,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView _buildGridView(RecommendedDone state) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: state.recommended?.length,
      itemBuilder: (context, index) {
        return RecommendedCardItem(
          recommended: state.recommended![index],
          radius: 10,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          textSize: 14,
          onTap: () {
            _descriptionNavigate(context);
          },
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Discover',
        style: AppStyles.s36w900.copyWith(
          fontSize: 32,
        ),
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _categoryCardItemBuilder(BuildContext context, int index) {
    return CategoryCardItem(
      place: _places.elementAt(index),
      radius: 19,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      textSize: 20,
      onTap: () {
        _descriptionNavigate(context);
      },
    );
  }

  void _descriptionNavigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Description(),
      ),
    );
  }
}
