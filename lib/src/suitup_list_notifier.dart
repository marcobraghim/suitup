import 'package:flutter/material.dart';

class SuitupListNotifier<T> extends ChangeNotifier {
  final List<T> _list;

  SuitupListNotifier(this._list);

  List<T> get items => _list;

  T get first => _list.first;
  T get last => _list.last;

  int get length => _list.length;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  T operator [](int index) => _list[index];

  void add(T item) {
    _list.add(item);
    notifyListeners();
  }

  void insert(int index, T item) {
    _list.insert(index, item);
    notifyListeners();
  }

  List<T> addAll(List<T> items) {
    _list.addAll(items);
    notifyListeners();

    return _list;
  }

  bool remove(T value) {
    final result = _list.remove(value);
    notifyListeners();

    return result;
  }

  T removeAt(int index) {
    final result = _list.removeAt(index);
    notifyListeners();

    return result;
  }

  void removeWhere(bool Function(T element) test) {
    _list.removeWhere(test);
    notifyListeners();
  }

  void retainWhere(bool Function(T element) test) {
    _list.retainWhere(test);
    notifyListeners();
  }

  bool contains(T item) => _list.contains(item);

  void update() => notifyListeners();

  void clear() {
    _list.clear();
    notifyListeners();
  }
}
