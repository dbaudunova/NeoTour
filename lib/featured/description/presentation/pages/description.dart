import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/description/presentation/bloc/description/description_bloc.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/info/presentation/pages/info_bottom_sheet.dart';
import 'package:neo_tour/featured/description/presentation/widgets/back_style.dart';
import 'package:neo_tour/featured/info/presentation/widgets/elevated_button_style.dart';
import 'package:neo_tour/featured/description/presentation/widgets/review_item.dart';

class Description extends StatefulWidget {
  const Description({super.key, this.recommendedEntity});

  final RecommendedEntity? recommendedEntity;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  void initState() {
    BlocProvider.of<DescriptionBloc>(context)
        .add(GetDescriptions(id: widget.recommendedEntity?.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBlocBuilder(),
    );
  }

  BlocBuilder<DescriptionBloc, DescriptionState> _buildBlocBuilder() {
    return _buildBuilder();
  }

  BlocBuilder<DescriptionBloc, DescriptionState> _buildBuilder() {
    return BlocBuilder<DescriptionBloc, DescriptionState>(
      builder: (context, state) {
        if (state is DescriptionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DescriptionError) {
          return Center(
            child: Text(
              'Something went wrong',
              style: AppStyles.s24w900,
            ),
          );
        }
        if (state is DescriptionDone) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        state.description?.images?.first ?? ''),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                child: BackStyle(
                  text: 'Back',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 16, top: 24, right: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.description?.name ?? '',
                            style: AppStyles.s24w900,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 14,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${state.description?.place}, ${state.description?.country}',
                                style: AppStyles.s12w400,
                              )
                            ],
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Description',
                            style: AppStyles.s20w600.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              state.description?.description ?? '',
                              style: AppStyles.s16w400,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Reviews',
                            style: AppStyles.s20w600.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              child: _buildListView(state)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildButton(context),
            ],
          );
        } else {
          return Text(
            'Oops',
            style: AppStyles.s24w900,
          );
        }
      },
    );
  }

  ListView _buildListView(DescriptionDone state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.description?.reviewDtoList?.length,
      itemBuilder: (context, index) {
        return ReviewItem(
          tourEntity: state.description!.reviewDtoList![index],
        );
      },
    );
  }

  Align _buildButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        padding:
        const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButtonStyle(
          onPressed: () {
            _showBottomSheet(context);
          },
          text: 'Book Now',
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return const InfoBottomSheet();
    },
  );
}
