part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

/// {@template custom_auth_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomAuthEvent extends AuthEvent {}
