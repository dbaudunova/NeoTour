import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/config/theme/app_theme.dart';
import 'package:neo_tour/featured/home/data/data_sources/remote/home_data_source.dart';
import 'package:neo_tour/featured/home/data/repository/home_repository_impl.dart';
import 'package:neo_tour/featured/home/domain/usecases/get_recommended_tours_use_case.dart';
import 'package:neo_tour/featured/home/presentation/bloc/recommended/recommended_bloc.dart';
import 'package:neo_tour/featured/onboarding/presentation/pages/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecommendedBloc>(
          create: (context) => RecommendedBloc(
            GetRecommendedToursUseCase(
              HomeRepositoryImpl(
                HomeDataSourceImpl(),
              ),
            ),
          ),
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