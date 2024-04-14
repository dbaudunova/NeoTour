import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/presentation/pages/home.dart';

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
                  style: AppStyles.s16w400.copyWith(height: 2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 40),
                child: _elevatedButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _elevatedButton(context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColors.primaryColor,
        ),
        maximumSize: MaterialStateProperty.all(
          const Size.fromWidth(178),
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      onPressed: () {
        _navigateHome(context);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Text(
              "Let's Go!",
              style: AppStyles.s16w500,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.arrowNext,
          ),
        ],
      ),
    );
  }

  void _navigateHome(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
