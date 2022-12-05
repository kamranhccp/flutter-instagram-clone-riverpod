import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/auth_results.dart';
import 'auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authProvider = ref.watch(authStateProvider);
  return authProvider.authResult == AuthResults.success;
});
