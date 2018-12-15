import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../model/done_list.dart';
import '../model/done.dart';

class DoneListAddition {
  final Done item;

  DoneListAddition(this.item);
}

class DoneListBloc {
  final _doneList = DoneList();

  final _items = BehaviorSubject<List<Done>>(seedValue: []);
  final _itemCount = BehaviorSubject<int>(seedValue: 0);
  final _itemAdditionController = StreamController<DoneListAddition>();

  Sink<DoneListAddition> get doneListAddition => _itemAdditionController.sink;
  ValueObservable<int> get itemCount =>
      _itemCount.stream.distinct().shareValue(seedValue: 0);
  ValueObservable<List<Done>> get items => _items.stream;

  DoneListBloc() {
    _itemAdditionController.stream.listen(_handleAction);
  }

  void dispose() {
    _items.close();
    _itemCount.close();
    _itemAdditionController.close();
  }

  void _handleAction(DoneListAddition addition) {
    _doneList.add(addition.item);
    _items.add(_doneList.items);
    _itemCount.add(_doneList.count);

    print(_items.value.map((Done done) => done.name));
  }
}
