import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/description/presentation/pages/description.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/home/presentation/bloc/places/places_bloc.dart';
import 'package:neo_tour/featured/home/presentation/bloc/recommended/recommended_bloc.dart';
import 'package:neo_tour/featured/home/presentation/widgets/category_card.dart';
import 'package:neo_tour/featured/home/presentation/widgets/recommended_card.dart';
import 'package:neo_tour/featured/home/presentation/widgets/tab_bar_style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final List<Tab> _tabs = [
    'popular',
    'featured',
    'visited',
    'europe',
    'asia',
  ].map((title) => Tab(text: title)).toList();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecommendedBloc>(context).add(GetRecommendedTours());
    BlocProvider.of<PlacesBloc>(context)
        .add(GetPlacesTours(name: _tabs[index].text.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TabBarStyle(
                    tabs: _tabs,
                    onTap: (index) {
                      final String category = _tabs[index].text.toString();
                      BlocProvider.of<PlacesBloc>(context).add(
                        GetPlacesTours(name: category),
                      );
                    },
                  ),
                ),
                _buildTabBlocBuilder(),
                const SizedBox(height: 16),
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
                _buildBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<PlacesBloc, PlacesState> _buildTabBlocBuilder() {
    return BlocBuilder<PlacesBloc, PlacesState>(builder: _buildTabBuilder);
  }

  Widget _buildTabBuilder(context, state) {
    if (state is PlacesLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is PlacesError) {
      return Center(
        child: Text(
          'Something went wrong',
          style: AppStyles.s24w900,
        ),
      );
    }
    if (state is PlacesDone) {
      return Padding(
        padding: const EdgeInsets.only(top: 24, left: 16),
        child: SizedBox(
          height: 254,
          child: _buildTabListView(state),
        ),
      );
    } else {
      return Text(
        'Oops',
        style: AppStyles.s24w900,
      );
    }
  }

  ListView _buildTabListView(PlacesDone state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.place?.length,
      padding: const EdgeInsets.only(right: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryCardItem(
          place: state.place![index],
          radius: 19,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          textSize: 20,
          onTap: () {
            _descriptionNavigate(context, state.place![index]);
          },
        );
      },
    );
  }

  BlocBuilder<RecommendedBloc, RecommendedState> _buildBlocBuilder() {
    return BlocBuilder<RecommendedBloc, RecommendedState>(
      builder: _buildRecommendedBuilder,
    );
  }

  Widget _buildRecommendedBuilder(context, state) {
    if (state is RecommendedLoading) {
      return const Center(
        child: CircularProgressIndicator(),
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
        padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
        child: _buildGridView(state),
      );
    } else {
      return Text(
        'Oops',
        style: AppStyles.s24w900,
      );
    }
  }

  GridView _buildGridView(RecommendedDone state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.recommended?.length,
      itemBuilder: (context, index) {
        return RecommendedCardItem(
          recommended: state.recommended![index],
          radius: 10,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          textSize: 14,
          onTap: () {
            _descriptionNavigate(context, state.recommended![index]);
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

  void _descriptionNavigate(
      BuildContext context, RecommendedEntity recommendedEntity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Description(
          recommendedEntity: recommendedEntity,
        ),
      ),
    );
  }
}
