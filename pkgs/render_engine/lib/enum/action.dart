enum ActionType {
  navigatePush,
  navigatePop,
  alertDialog,
  snackBar,
  // microflow,
  voided,
}

Map<int, ActionType> mapActionItems = {
  1: ActionType.navigatePush,
  2: ActionType.navigatePop,
  3: ActionType.alertDialog,
  4: ActionType.snackBar,
  // 5: ActionType.microflow,
};

extension ActionTypeExtension on ActionType {
  String get value {
    switch (this) {
      case ActionType.navigatePush:
        return 'Navigate (To)';
      case ActionType.navigatePop:
        return 'Navigate (Back)';
      case ActionType.alertDialog:
        return 'Alert Dialog';
      case ActionType.snackBar:
        return 'Snack Bar';
      // case ActionType.microflow:
      //   return 'Microflow';
      default:
        return '';
    }
  }
}
