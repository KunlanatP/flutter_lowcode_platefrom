enum TypeOfAction { onTap, onDoubleTap, onLongPress }

Map<int, TypeOfAction> mapTypeOfAction = {
  1: TypeOfAction.onTap,
  2: TypeOfAction.onDoubleTap,
  3: TypeOfAction.onLongPress,
};

final List<String> listItems = [
  TypeOfAction.onTap.value,
  TypeOfAction.onDoubleTap.value,
  TypeOfAction.onLongPress.value,
];

extension TypeOfActionExtension on TypeOfAction {
  String get value {
    switch (this) {
      case TypeOfAction.onTap:
        return 'On Tap';
      case TypeOfAction.onDoubleTap:
        return 'On Double Tap';
      case TypeOfAction.onLongPress:
        return 'On Long Press';
      default:
        return 'On Tap';
    }
  }
}
