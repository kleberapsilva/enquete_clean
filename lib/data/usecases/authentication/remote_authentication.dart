import 'package:enquete/domain/helpers/helpers.dart';
import 'package:meta/meta.dart';

import 'package:enquete/domain/usecases/usecases.dart';

import 'package:enquete/data/http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    try {
      await httpClient.request(url: url, method: 'post', body: RemoteAuthenticationParams.fromDomain(params).toJson());
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized ? DomainError.invalidCrendentials : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({@required this.email, @required this.password});

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) => RemoteAuthenticationParams(email: params.email, password: params.password);

  Map toJson() => {'email': email, 'password': password};
}
