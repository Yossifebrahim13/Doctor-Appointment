import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';

import '../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody requestBody) async {
    try {
      final response = await _apiService.login(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
