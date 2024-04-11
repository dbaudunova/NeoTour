import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/config/constants/app_styles.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(37),
                  bottomRight: Radius.circular(37),
                ),
                child: Image.asset(
                  AppAssets.onboarding,
                  height: 480,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 32),
                child: Text(
                  'Winter\nVacation Trips',
                  style: AppStyles.s36w900,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12),
                child: Text(
                  '''Enjoy your winter vacations with warmth\nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!''',
                  style: AppStyles.s16w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 40),
                child: _buildButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildButton() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 17, 19, 17),
                child: Text(
                  "Let's Go",
                  style: AppStyles.s16w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SvgPicture.asset(
                  AppAssets.arrowNext,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
