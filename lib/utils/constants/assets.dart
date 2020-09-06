class _AssetsIcons {
  const _AssetsIcons._();

  final String approve = 'assets/icons/approve.svg';
  final String archive = 'assets/icons/archive.svg';
  final String aze = 'assets/icons/aze.svg';
  final String bin = 'assets/icons/bin.svg';
  final String dark = 'assets/icons/dark.svg';
  final String drawerArchive = 'assets/icons/drawer_archive.svg';
  final String eng = 'assets/icons/eng.svg';
  final String filter = 'assets/icons/filter.svg';
  final String home = 'assets/icons/home.svg';
  final String light = 'assets/icons/light.svg';
  final String noTask = 'assets/icons/no_task.svg';
  final String ru = 'assets/icons/ru.svg';
  final String share = 'assets/icons/share.svg';
}

class _AssetsLangs {
  const _AssetsLangs._();

  final String az = 'assets/langs/az.json';
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

