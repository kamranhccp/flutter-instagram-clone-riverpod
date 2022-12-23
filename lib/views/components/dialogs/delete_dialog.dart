import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_kamranhccp/views/components/dialogs/alert_dialog_model.dart';

import '../constants/strings.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
          title: '${Strings.delete} $titleOfObjectToDelete?',
          message:
              '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete?',
          buttons: const {
            Strings.delete: true,
            Strings.cancel: false,
          },
        );
}
