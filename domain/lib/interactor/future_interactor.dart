import 'dart:async';

import 'package:domain/interactor/composite_subscription.dart';

abstract class FutureInteractor<T> {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  void execute({
    void onData(T event),
    Function onError,
    void onDone(),
    bool cancelOnError,
  }) {
    _clearSubscription();
    StreamSubscription<T> streamSubscription = run().asStream().listen(
      onData,
      onError: onError,
      onDone: () {
        _clearSubscription();
        onDone();
      },
      cancelOnError: cancelOnError,
    );
    compositeSubscription.add(streamSubscription);
  }

  void unsubscribe() {
    _clearSubscription();
  }

  void _clearSubscription() {
    if (compositeSubscription != null) {
      compositeSubscription.clear();
    }
  }

  Future<T> run();
}
