import 'package:flutter/widgets.dart';
import './done_list.dart';

class DoneListProvider extends InheritedWidget {
  final DoneListBloc doneListBloc;

  DoneListProvider({
    Key key,
    DoneListBloc doneListBloc,
    Widget child,
  })  : doneListBloc = doneListBloc ?? DoneListBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static DoneListBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(DoneListProvider)
              as DoneListProvider)
          .doneListBloc;
}
