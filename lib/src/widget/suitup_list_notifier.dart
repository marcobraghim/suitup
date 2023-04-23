import 'package:flutter/material.dart';

/// By default a list inside a `ValueNotifier` will observe its changes only when
/// the list is completely replaced and changes on its items will not take any
/// effect.
///
/// With `SuitupListNotifier` every change on its items will be rebuilt on the
/// screen on its signed `SuitupObserver`.
class SuitupListNotifier<T> extends ChangeNotifier {
  final List<T> _list;

  /// The list of defined type
  SuitupListNotifier(this._list);

  /// The items itself
  List<T> get items => _list;

  /// The first item
  T get first => _list.first;

  /// The last item
  T get last => _list.last;

  /// Number of the items on the list
  int get length => _list.length;

  /// True if the list is empty
  bool get isEmpty => _list.isEmpty;

  /// True if the list is not empty
  bool get isNotEmpty => _list.isNotEmpty;

  /// Return an item on the [index]
  T operator [](int index) => _list[index];

  /// Add an item to the list and notify rebuild `SuitupObserver`
  void add(T item) {
    _list.add(item);
    notifyListeners();
  }

  /// Add an item on the [index] to the list and notify rebuild `SuitupObserver`
  void insert(int index, T item) {
    _list.insert(index, item);
    notifyListeners();
  }

  /// Add all the [items] to the list and notify rebuild `SuitupObserver`
  List<T> addAll(List<T> items) {
    _list.addAll(items);
    notifyListeners();

    return _list;
  }

  /// Remove the [item] from the list and notify rebuild `SuitupObserver`
  bool remove(T item) {
    final result = _list.remove(item);
    notifyListeners();

    return result;
  }

  T elementAt(int index) => _list.elementAt(index);

  /// Remove an item on the [index] from the list and notify rebuild `SuitupObserver`
  T removeAt(int index) {
    final result = _list.removeAt(index);
    notifyListeners();

    return result;
  }

  /// Implement your own remove function and notify rebuild `SuitupObserver`
  void removeWhere(bool Function(T element) test) {
    _list.removeWhere(test);
    notifyListeners();
  }

  /// Removes all objects from this list that fail to satisfy [test]. Then notify rebuild `SuitupObserver`
  void retainWhere(bool Function(T element) test) {
    _list.retainWhere(test);
    notifyListeners();
  }

  /// True when the [item] is on the list
  bool contains(T item) => _list.contains(item);

  /// Force notify rebuild `SuitupObserver`
  void update() => notifyListeners();

  /// Remove all elements on the list and notify rebuild `SuitupObserver`
  void clear() {
    _list.clear();
    notifyListeners();
  }
}
