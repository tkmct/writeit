import './done.dart';

class DoneList {
  final List<Done> _items = [];

  List<Done> get items => _items;
  int get count => _items.length;

  add(Done item) {
    this._items.add(item);
  }
}