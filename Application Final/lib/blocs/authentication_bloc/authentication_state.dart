part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthentucated, unknown}

class AuthenticationState extends Equatable { 
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user
  });

  final AuthenticationStatus status;
  final MyUser? user;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(MyUser myUser):
    this._(status:  AuthenticationStatus.authenticated, user: myUser);

  const AuthenticationState.unauthentucated():
    this._(status: AuthenticationStatus.unauthentucated);

  @override
  List<Object?> get props => [status, user];

}