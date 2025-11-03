import 'package:mobx/mobx.dart';
import 'package:pcea_app/features/voluntario/domain/entities/voluntario.dart';
import 'package:pcea_app/features/voluntario/domain/repositories/voluntario_repository.dart';

part 'voluntario_store.g.dart';

class VoluntarioStore = _VoluntarioStoreBase with _$VoluntarioStore;

abstract class _VoluntarioStoreBase with Store {
  final VoluntarioRepository repository;

  _VoluntarioStoreBase(this.repository);

  @observable
  Voluntario? voluntario;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> loadVoluntario(int id) async {
    try {
      isLoading = true;
      voluntario = await repository.getVoluntarioById(id);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> updateNome(String nome) async {
    if (voluntario == null) return;
    try {
      isLoading = true;
      voluntario = await repository.updateVoluntario(
        voluntario!.copyWith(nome: nome),
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> updateEmail(String email) async {
    if (voluntario == null) return;
    try {
      isLoading = true;
      voluntario = await repository.updateVoluntario(
        voluntario!.copyWith(email: email),
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> updateSenha(String senha) async {
    if (voluntario == null) return;
    try {
      isLoading = true;
      voluntario = await repository.updateVoluntario(
        voluntario!.copyWith(senha: senha),
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
