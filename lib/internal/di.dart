import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_tour/featured/description/data/data_sources/remote/description_data_source.dart';
import 'package:neo_tour/featured/description/data/repository/description_repository_impl.dart';
import 'package:neo_tour/featured/description/domain/repository/description_repository.dart';
import 'package:neo_tour/featured/description/domain/usecases/get_reviews_use_case.dart';
import 'package:neo_tour/featured/description/domain/usecases/get_tours_use_case.dart';
import 'package:neo_tour/featured/description/presentation/bloc/description/description_bloc.dart';
import 'package:neo_tour/featured/description/presentation/bloc/review/review_bloc.dart';
import 'package:neo_tour/featured/home/data/data_sources/remote/home_data_source.dart';
import 'package:neo_tour/featured/home/data/repository/home_repository_impl.dart';
import 'package:neo_tour/featured/home/domain/repository/home_repository.dart';
import 'package:neo_tour/featured/home/domain/usecases/get_places_tours_use_case.dart';
import 'package:neo_tour/featured/home/domain/usecases/get_recommended_tours_use_case.dart';
import 'package:neo_tour/featured/home/presentation/bloc/places/places_bloc.dart';
import 'package:neo_tour/featured/home/presentation/bloc/recommended/recommended_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerFactory<HomeDataSource>(() => HomeDataSourceImpl());
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));
  sl.registerSingleton<GetRecommendedToursUseCase>(
      GetRecommendedToursUseCase(sl()));
  sl.registerFactory<RecommendedBloc>(() => RecommendedBloc(sl()));

  sl.registerFactory<DescriptionDataSource>(() => DescriptionDataSourceImpl());
  sl.registerSingleton<DescriptionRepository>(DescriptionRepositoryImpl(sl()));
  sl.registerSingleton<GetReviewsUseCase>(GetReviewsUseCase(sl()));
  sl.registerFactory<ReviewBloc>(() => ReviewBloc(sl()));

  sl.registerSingleton<GetPlacesToursUseCase>(GetPlacesToursUseCase(sl()));
  sl.registerFactory<PlacesBloc>(() => PlacesBloc(sl()));

  sl.registerSingleton<GetToursUseCase>(GetToursUseCase(sl()));
  sl.registerFactory<DescriptionBloc>(() => DescriptionBloc(sl()));
}
