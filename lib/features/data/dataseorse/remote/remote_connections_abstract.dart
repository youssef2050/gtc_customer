import 'package:gtc_customer/features/data/Model/base_register_model.dart';
import 'package:gtc_customer/features/data/dataseorse/remote/register_dio.dart';

abstract class RemoteConnectionsAbstract {
  Future<BaseRegisterModel> register(String name, String email, String mobile,
      String password, String passwordConfirmation);
}

class RemoteConnectionDio extends RemoteConnectionsAbstract {
  RegisterDio _registerDio;

  RemoteConnectionDio(this._registerDio);
  @override
  Future<BaseRegisterModel> register(String name, String email, String mobile,
      String password, String passwordConfirmation) async {
    var rep = await _registerDio.dio.post('register', queryParameters: {
      'name': name,
      'email': email,
      'mobile': mobile,
      'password_confirmation': passwordConfirmation,
      'password': password,
    });
    return rep.data;
  }
}
