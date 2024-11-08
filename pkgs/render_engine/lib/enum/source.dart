enum Source { specific, variable }

Map<int, Source> mapSourceType = {
  1: Source.specific,
  2: Source.variable,
};

extension SourceExtension on Source {
  String get value {
    switch (this) {
      case Source.specific:
        return 'Specific Value';
      case Source.variable:
        return 'Variable';
      default:
        return 'Specific Value';
    }
  }
}
