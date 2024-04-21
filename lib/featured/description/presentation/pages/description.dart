import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/description/domain/model/review.dart';
import 'package:neo_tour/featured/info/presentation/pages/info_bottom_sheet.dart';
import 'package:neo_tour/featured/description/presentation/widgets/back_style.dart';
import 'package:neo_tour/featured/info/presentation/widgets/elevated_button_style.dart';
import 'package:neo_tour/featured/description/presentation/widgets/review_item.dart';

class Description extends StatelessWidget {
  Description({super.key});

  final _reviews = [
    Review(
      id: 0,
      avatar: AppAssets.avatar,
      name: 'Anonymous',
      review:
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    ),
    Review(
      id: 1,
      avatar: AppAssets.avatar,
      name: 'Anonymous',
      review:
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    ),
    Review(
      id: 2,
      avatar: AppAssets.avatar,
      name: 'Anonymous',
      review:
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    ),
    Review(
      id: 3,
      avatar: AppAssets.avatar,
      name: 'Anonymous',
      review:
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    ),
    Review(
      id: 4,
      avatar: AppAssets.avatar,
      name: 'Anonymous',
      review:
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    ),
    Review(
      id: 5,
      avatar: AppAssets.avatar,
      name: 'Anonymous',
      review:
          'That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.mountain),
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
                padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mount Fuji',
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
                            'Honshu, Japan',
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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim eget amet viverra eget fames rhoncus. Eget enim venenatis enim porta egestas malesuada et. Consequat mauris lacus euismod montes.',
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
                      _buildListView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButtonStyle(
                onPressed: () {
                  _showBottomSheet(context);
                },
                text: 'Book Now',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return const InfoBottomSheet();
      },
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        return ReviewItem(review: _reviews.elementAt(index));
      },
    );
  }
}
