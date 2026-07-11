import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/core/networking/dio_factory.dart';
import 'package:doctor_appointment/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/signup/data/repos/sign_up_repo.dart';
import '../../features/signup/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  // login repo is singleton because it doesn't contain any state
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  // each time we need login cubit we create new instance
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // Signup
  // signup repo is singleton because it doesn't contain any state
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(getIt<ApiService>()),
  );
  // each time we need signup cubit we create new instance
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignUpRepo>()));
}
