import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/state/providers/image_uploader_provider.dart';

import '../auth/providers/auth_state_provider.dart';

final isLoadingProvider = Provider<bool>(
  (ref) {
    final authState = ref.watch(authStateProvider);
    final isUploadingImage = ref.watch(imageUploaderProvider);

    return authState.isLoading || isUploadingImage;
  },
);
