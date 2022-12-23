import 'package:instagram_clone_kamranhccp/state/comments/models/comment.dart';
import 'package:instagram_clone_kamranhccp/state/comments/models/post_comments_request.dart';

import '../../../enums/date_sorting.dart';

extension Sorting on Iterable<Comment> {
  Iterable<Comment> applySortingFrom(RequestForPostAndComment request) {
    if (request.sortByCreatedAt) {
      final sortedDocument = toList()
        ..sort(
          (a, b) {
            switch (request.dateSorting) {
              case DateSorting.newestOnTop:
                return b.createdAt.compareTo(a.createdAt);

              case DateSorting.oldestOnTop:
                return a.createdAt.compareTo(b.createdAt);
            }
          },
        );
      return sortedDocument;
    } else {
      return this;
    }
  }
}
