import 'package:flutter_modular/flutter_modular.dart';
import 'package:pcea_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pcea_app/features/auth/data/repositories/auth_remote_data_source.dart';
import 'package:pcea_app/features/auth/data/repositories/auth_repository_mock.dart';
import 'package:pcea_app/features/auth/presentation/store/auth_store.dart';

import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_user.dart';
import 'presentation/pages/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<AuthRepository>((i) => AuthRepositoryMock()),
    Bind.singleton((i) => AuthRemoteDataSourceImpl()),
    Bind.singleton<AuthRemoteDataSource>((i) => AuthRemoteDataSourceImpl()),
    Bind.singleton((i) => AuthRepositoryImpl(i())),
    Bind.singleton<AuthRepository>((i) => AuthRepositoryImpl(i())),
    Bind.singleton((i) => LoginUser(i())),
    Bind.singleton((i) => AuthStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => LoginPage()),
  ];
}
