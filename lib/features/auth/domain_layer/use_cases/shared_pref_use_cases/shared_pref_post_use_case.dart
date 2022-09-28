import 'package:booking_app/features/auth/data_layer/local_service/shared_pref_helper.dart';

class SharedPrefPostUseCase {
  final SharedPrefHelper _prefHelper;

  SharedPrefPostUseCase(this._prefHelper);
  Future<bool> call({dynamic value, required String key}) async {
    return _prefHelper.setValue(value: value, key: key);
  }
}
