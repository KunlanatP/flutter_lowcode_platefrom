enum AlertDialogType {
  information,
  confirmation,
}

Map<int, AlertDialogType> mapAlertDialogTypeItems = {
  1: AlertDialogType.information,
  2: AlertDialogType.confirmation,
};

extension AlertDialogTypeExtension on AlertDialogType {
  String get value {
    switch (this) {
      case AlertDialogType.information:
        return 'Information Dialog';
      case AlertDialogType.confirmation:
        return 'Confirmation Dialog';
      default:
        return 'Information Dialog';
    }
  }
}

enum AlertDialogMenu {
  title,
  message,
  dismissText,
  confirmText,
}

extension AlertDialogMenuExtension on AlertDialogMenu {
  String get value {
    switch (this) {
      case AlertDialogMenu.title:
        return 'Title';
      case AlertDialogMenu.message:
        return 'Message';
      case AlertDialogMenu.dismissText:
        return 'Dismiss Text';
      case AlertDialogMenu.confirmText:
        return 'Confirm Text';
      default:
        return 'Title';
    }
  }
}
