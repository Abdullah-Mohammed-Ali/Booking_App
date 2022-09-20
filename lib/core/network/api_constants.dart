class ApiConstants {
  static const String baseUrl = 'http://api.mahmoudtaha.com/api';

  static String facilitiesPath() => '$baseUrl/facilities';

  static String searchHotelsPath() => '$baseUrl/search-hotels';

  static String registerAuthPath() => '$baseUrl/auth/register';

  static String loginAuthPath() => '$baseUrl/auth/login';
}

class QueryParametersHeaders {
  static const String authName = 'name';
  static const String authPass = 'password';
  static const String authPassConfirmation = 'password_confirmation';
  static const String authEmail = 'email';
}
