enum QrTypeItems { render, scanner }

extension QrTypeItemsExtension on QrTypeItems {
  String get value {
    switch (this) {
      case QrTypeItems.render:
        return 'QR-Code Rendering';
      case QrTypeItems.scanner:
        return 'QR-Code Scanner';
      default:
        return 'QR-Code Rendering';
    }
  }
}
