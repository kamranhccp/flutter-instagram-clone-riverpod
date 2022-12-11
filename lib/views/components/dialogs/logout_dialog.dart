import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_kamranhccp/views/components/constants/strings.dart';
import 'alert_dialog_model.dart';

@immutable
class LogoutDialog extends AlertDialogModel<bool> {
  const LogoutDialog()
      : super(
          title: Strings.logOut,
          message: Strings.areYouSureYouWantToLogOutOfTheApp,
          buttons: const {
            Strings.logOut: true,
            Strings.cancel: false,
          },
        );
}
