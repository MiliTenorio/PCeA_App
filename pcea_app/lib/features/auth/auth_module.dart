import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/auth_remote_datasource_impl.dart';
import 'data/repositories/auth_repository_impl.dart';

import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_user.dart';

import 'presentation/stores/auth_store.dart';
import 'presentation/pages/login_page.dart';
import 'package:http/http.dart' as http;

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => http.Client()),

    Bind.singleton<AuthRemoteDataSource>(
      (i) => AuthRemoteDataSourceImpl(i()),
    ),

    Bind.singleton<AuthRepository>(
      (i) => AuthRepositoryImpl(i()),
    ),

    Bind.singleton((i) => LoginUser(i())),
    Bind.singleton((i) => AuthStore(i())),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const LoginPage()),
  ];
}

