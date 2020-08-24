class _AssetsFonts {
  const _AssetsFonts._();

  final String gitkeep = 'assets/fonts/.gitkeep';
}

class _AssetsIcons {
  const _AssetsIcons._();

  final String gitkeep = 'assets/icons/.gitkeep';
}

class _AssetsLangs {
  const _AssetsLangs._();

  final String en = 'assets/langs/en.json';
}

/// stores [assets details]
class Assets {
  const Assets._();


  /// fonts used in app
  static const fonts = _AssetsFonts._();
  /// icons used in app
  static const icons = _AssetsIcons._();
  /// langs used in app
  static const langs = _AssetsLangs._();
}

