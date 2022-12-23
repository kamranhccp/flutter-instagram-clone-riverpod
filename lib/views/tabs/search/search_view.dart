import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_kamranhccp/views/extensions/dismiss_keyboard.dart';

import '../../components/search_grid_view.dart';
import '../../constants/strings.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final searchTerm = useState('');

    useEffect(() {
      controller.addListener(
        () {
          searchTerm.value = controller.text;
        },
      );
      return () {};
    }, [controller]);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              labelText: Strings.enterYourSearchTermHere,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear_outlined,
                ),
                onPressed: () {
                  controller.clear();
                  dismissKeyboard();
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: SearchGridView(
            searchTerm: searchTerm.value,
          ),
        ),
      ],
    );
  }
}
