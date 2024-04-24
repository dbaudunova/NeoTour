import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/featured/home/presentation/pages/home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                height: MediaQuery.of(context).size.height / 2.1,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical:32).copyWith(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Winter\nVacation Trips',
                    style: AppStyles.s36w900,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '''Enjoy your winter vacations with warmth\nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!''',
                    style: AppStyles.s16w400.copyWith(height: 2),
                  ),
                  const SizedBox(height: 40),
                  _elevatedButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _elevatedButton(context) {
    return ElevatedButton(
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

  void _navigateHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }
}
