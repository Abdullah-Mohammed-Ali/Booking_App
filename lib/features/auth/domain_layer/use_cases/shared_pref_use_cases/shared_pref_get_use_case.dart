import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/usecase/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../data_layer/local_service/shared_pref_helper.dart';

class SharedPrefGetUseCase {
  final SharedPrefHelper _prefHelper;

  SharedPrefGetUseCase(this._prefHelper);

  dynamic call(String key) {
    return _prefHelper.getValue(key: key);
  }
}
