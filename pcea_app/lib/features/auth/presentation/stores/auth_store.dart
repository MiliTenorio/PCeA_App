import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pcea_app/features/auth/domain/entities/auth_token.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/entities/user.dart';

part '../stores/auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LoginUser loginUser;

  _AuthStoreBase(this.loginUser);

  @observable
  bool isLoading = false;

  @observable
  User? user;

  @observable
  AuthToken? authToken;

  @observable
  String? errorMessage;

  @computed
  bool get isLoggedIn => authToken != null; 
  
  @computed
  bool get isUserIn => user != null;

  Future<void> login(String email, String password) async {
    try {
      isLoading = true;
      errorMessage = null;

      //authToken = await loginUser(email, password);

      Modular.to.navigate('/home');
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  void logout() {
    user = null;
  }
}
