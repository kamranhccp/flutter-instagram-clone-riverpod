// This class contains three things:
// 1. Error that tell user about error that this account already exists with different credentials
// 2.

import 'package:flutter/foundation.dart' show immutable;

// this comes from foundation.dart file in flutter
@immutable
class Constants {
  static const accountAlreadyExistsWithDifferentCredentials =
      'account-already-exists-with-different-credentials';
  static const googleCom = 'google.com';
  static const emailScope = 'email';
  const Constants._(); // this is a private constructor so that it cannot be instantiated outside of this class

}
