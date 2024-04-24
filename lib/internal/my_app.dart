import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/config/theme/app_theme.dart';
import 'package:neo_tour/featured/description/presentation/bloc/description/description_bloc.dart';
import 'package:neo_tour/featured/description/presentation/bloc/review/review_bloc.dart';
import 'package:neo_tour/featured/home/presentation/bloc/places/places_bloc.dart';
import 'package:neo_tour/featured/home/presentation/bloc/recommended/recommended_bloc.dart';
import 'package:neo_tour/featured/onboarding/presentation/pages/onboarding.dart';
import 'package:neo_tour/internal/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecommendedBloc>(
          create: (context) => sl<RecommendedBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ReviewBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<PlacesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<DescriptionBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        home: const Onboarding(),
      ),
    );
  }
}
