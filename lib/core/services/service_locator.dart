import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sayarah/core/commom_bloc/connection_check_bloc/connection_check_bloc.dart';
import 'package:sayarah/core/services/api_services.dart';
import 'package:sayarah/core/services/network_service.dart';
import 'package:sayarah/features/login_feature/data/data_source/login_data_source.dart';
import 'package:sayarah/features/login_feature/data/repositories/login_repository_impl.dart';
import 'package:sayarah/features/login_feature/domain/repositories/login_repository.dart';
import 'package:sayarah/features/login_feature/domain/use_case/login_use_case.dart';
import 'package:sayarah/features/login_feature/presentation/bloc/login_bloc.dart';
import 'package:sayarah/features/splash_feature/data/data_source/remote_data_source/splash_remote_data_source.dart';
import 'package:sayarah/features/splash_feature/data/repositories/splash_repo_impl.dart';
import 'package:sayarah/features/splash_feature/domain/repository/splash_repositiory.dart';
import 'package:sayarah/features/splash_feature/domain/use_case/splash_usecase.dart';
import 'package:sayarah/features/splash_feature/presentation/bloc/splash_bloc/splash_bloc.dart';
import '../../features/signup_feature/data/data_source/pairing_data_source.dart';
import '../../features/signup_feature/data/repo/pairing_repo_impl.dart';
import '../../features/signup_feature/domain/repository/pairing_repository.dart';
import '../../features/signup_feature/domain/use_case/pairing_use_case.dart';
import '../../features/signup_feature/presentation/bloc/pairing_bloc/pairing_bloc.dart';

final sl = GetIt.instance; // sl = service locator

void init() {
  sl.registerLazySingleton<ApiServices>(() => ApiServices(Dio()));
  sl.registerLazySingleton<NetworkService>(
    NetworkService.new,
  );
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  ); // data source
  registerRemoteDataSource();
  registerRepositories();
  registerUseCase();
  registerBloc();
}

void registerRemoteDataSource() {
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(service: sl()),
  );
  sl.registerLazySingleton<PairingDataSource>(() => PairingDataSourceImplement(service: sl()));
  sl.registerLazySingleton<SplashRemoteDataSource>(() => SplashRemoteDataSourceImpl(service: sl()));
}

void registerUseCase() {
  sl.registerLazySingleton(
    () => LoginUseCase(sl()),
  );
  sl.registerLazySingleton(() => PairingUseCase(sl()));
  sl.registerLazySingleton(() => SplashUseCase(sl()));
}

void registerRepositories() {
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PairingRepository>(() => PairingRepoImpl(dataSource: sl()));
  sl.registerLazySingleton<SplashRepository>(() => SplashRepoImpl(sl()));
}

void registerBloc() {
  sl.registerLazySingleton(
    () => LoginBloc(
      loginUseCase: sl(),
    ),
  );
  sl.registerLazySingleton(() => PairingBloc(useCase: sl<PairingUseCase>()));
  sl.registerLazySingleton(() => SplashBloc(sl<SplashUseCase>()));
  sl.registerLazySingleton(() => ConnectionCheckBloc());
}
