import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/auth/models/auth_results.dart';
import 'package:instagram_clone_kamranhccp/state/user_info/backend/user_info_storage.dart';
import '../../posts/typedef/user_id.dart';
import '../backend/authenticator.dart';
import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn()) {
      state = AuthState(
        authResult: AuthResults.success,
        isLoading: false,
        userId: _authenticator.userID,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final results = await _authenticator.loginWithGoogle();
    final userID = _authenticator.userID;
    if (results == AuthResults.success && userID != null) {
      await saveUserInfo(
        userID: userID,
      );
    }
    state = AuthState(
      authResult: results,
      isLoading: false,
      userId: userID,
    );
  }

  Future<void> loginWithFacebook() async {
    state = state.copiedWithIsLoading(true);
    final results = await _authenticator.loginWithFacebook();
    final userID = _authenticator.userID;
    if (results == AuthResults.success && userID != null) {
      await saveUserInfo(
        userID: userID,
      );
    }
    state = AuthState(
      authResult: results,
      isLoading: false,
      userId: userID,
    );
  }

  Future<void> saveUserInfo({required UserId userID}) =>
      _userInfoStorage.saveUserInfo(
        userID: userID,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
      );
}
