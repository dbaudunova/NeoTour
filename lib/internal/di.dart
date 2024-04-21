import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_tour/featured/home/data/data_sources/remote/home_data_source.dart';
import 'package:neo_tour/featured/home/data/repository/home_repository_impl.dart';
import 'package:neo_tour/featured/home/domain/repository/home_repository.dart';
import 'package:neo_tour/featured/home/domain/usecases/get_recommended_tours_use_case.dart';
import 'package:neo_tour/featured/home/presentation/bloc/recommended/recommended_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerFactory<HomeDataSource>(() => HomeDataSourceImpl());
  sl.registerSingleton<HomeRepository>(HomeRepositoryImpl(sl()));
  sl.registerSingleton<GetRecommendedToursUseCase>(GetRecommendedToursUseCase(sl()));
  sl.registerFactory<RecommendedBloc>(() => RecommendedBloc(sl()));
}