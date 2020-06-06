import 'package:rxdart/rxdart.dart';

class DelayedListItemPublisher {
  static DelayedListItemPublisher _listBloc;
  factory DelayedListItemPublisher() {
    if (_listBloc == null) _listBloc = new DelayedListItemPublisher._();

    return _listBloc;
  }

  PublishSubject<int> _positionItem;
  DelayedListItemPublisher._() {
    _positionItem = new PublishSubject<int>();
  }

  Stream<int> get listenAnimation => _positionItem.stream;

  void startAnimation(int limit, Duration duration) async {
    for (var i = -1; i < limit; i++) {
      await new Future.delayed(duration, () {
        _updatePosition(i);
      });
    }
  }

  void _updatePosition(int position) {
    if (!_positionItem.isClosed) {
      _positionItem.add(position);
    }
  }

  dispose() {
    _listBloc = null;
    _positionItem.close();
  }
}
