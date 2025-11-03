import 'package:mobx/mobx.dart';

import '../../domain/entities/usuario.dart';
import '../../domain/usecases/login_user.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final LoginUser loginUser;

  _AuthStoreBase(this.loginUser);

  @observable
  bool isLoading = false;

  @observable
  Usuario? usuario;

  @observable
  String? errorMessage;

  @computed
  bool get isLoggedIn => usuario != null;

  @action
  Future<void> login(String email, String senha) async {
    isLoading = true;
    errorMessage = null;
    try {
      final result = await loginUser.call(email, senha);
      usuario = result;
    } catch (e) {
      errorMessage = e.toString();
      usuario = null;
    } finally {
      isLoading = false;
    }
  }

  @action
  void logout() {
    usuario = null;
    errorMessage = null;
    // opcional: remover token salvo no storage
  }
}
