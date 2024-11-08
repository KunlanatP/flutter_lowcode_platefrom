class Action<T> {
  final String type;
  final T data;

  Action(this.type, this.data);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Action<T> && other.type == type && other.data == data;
  }

  @override
  int get hashCode => type.hashCode ^ data.hashCode;
}

class GeneralAction extends Action<Map<String, dynamic>> {
  GeneralAction(String type, Map<String, dynamic> data) : super(type, data);
}

abstract class Dispatcher {
  Future<void> dispatch(Action action);
}

class NoopActionDispather extends Dispatcher {
  @override
  Future<void> dispatch(Action action) async {}
}
