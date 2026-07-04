import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/networking/api_constant.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Auth Apis
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}
