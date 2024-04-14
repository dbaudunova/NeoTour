import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_assets.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppAssets.mountain,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
