class _AssetsIcons {
  const _AssetsIcons._();

  final String archive = 'assets/icons/archive.svg';
  final String bin = 'assets/icons/bin.svg';
}

class _AssetsLangs {
  const _AssetsLangs._();

  final String en = 'assets/langs/en.json';
}

/// stores [assets details]
class Assets {
  const Assets._();


  /// icons used in app
  static const icons = _AssetsIcons._();
  /// langs used in app
  static const langs = _AssetsLangs._();
}

