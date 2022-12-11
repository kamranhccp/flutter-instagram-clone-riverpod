import 'package:instagram_clone_kamranhccp/views/components/animations/lottie_animation_view.dart';

import 'models/lottie_animation.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(
          animation: LottieAnimation.empty,
        );
}
