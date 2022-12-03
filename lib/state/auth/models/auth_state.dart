import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_kamranhccp/state/posts/typedef/user_id.dart';
import 'auth_results.dart';

// it has loading properties
@immutable
class AuthState {
  final AuthResults? authResult;
  final bool isLoading;
  final UserId? userId;

  const AuthState({
    required this.authResult,
    required this.isLoading,
    required this.userId,
  });

  // when app start and we don't know the state of the user
  // we don't know if the user is logged in or not logged in or loading or not loading
  // so we have to create a factory constructor
  const AuthState.unknown()
      : authResult = null,
        isLoading = false,
        userId = null;

  // copiedWithIsLoading is a method that returns a copy of the AuthState that uses isLoading
  // but with the isLoading property changed
  // so we can use this method to change the isLoading property
  // and advantage of this method is that we don't have to change all the properties
  copiedWithIsLoading(bool isLoading) => AuthState(
        authResult: authResult,
        isLoading: isLoading,
        userId: userId,
      );

  // operator == will be used when objects/id are compared
  // and if its same then it will return true
  // and if its not same then it will return false
  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (authResult == other.authResult &&
          isLoading == other.isLoading &&
          userId == other.userId);

  // hashCode is a method that returns a hash code for this object
  // and its used to determine if two objects are the same
  @override
  int get hashCode => Object.hash(
        authResult,
        isLoading,
        userId,
      );
}
