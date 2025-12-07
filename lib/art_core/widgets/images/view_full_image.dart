part of 'images.dart';

class ViewFullImage extends StatelessWidget {
  final String imageUrl;
  final Object? heroTag;

  const ViewFullImage({
    super.key,
    required this.imageUrl,
    this.heroTag,
  });

  /// --- open as full screen page with transition ---
  static Future<T?> openPage<T>(
      BuildContext context, {
        required String imageUrl,
        Object? heroTag,
      }) {
    return Navigator.of(context).push<T>(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (_, _, _) => ViewFullImage(imageUrl: imageUrl, heroTag: heroTag),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
            child: ScaleTransition(
              scale: Tween(begin: 0.98, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn)),
              child: child,
            ),
          );
        },
      ),
    );
  }

  /// --- open as dialog (centered) with transition ---
  static Future<T?> openDialog<T>(
      BuildContext context, {
        required String imageUrl,
        Object? heroTag,
      }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) =>
          ViewFullImage(imageUrl: imageUrl, heroTag: heroTag),
      transitionBuilder: (_, animation, __, child) {
        final curved =
        CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  // ----- helpers: detect type/source -----
  Uri? get _uri {
    try {
      return Uri.tryParse(imageUrl.trim());
    } catch (_) {
      return null;
    }
  }

  bool get _isNetwork =>
      _uri?.hasScheme == true &&
          (_uri!.scheme == 'http' || _uri!.scheme == 'https');

  bool get _isFileScheme => _uri?.scheme == 'file';
  bool get _isAbsolutePath => imageUrl.startsWith('/');
  bool get _isAsset => imageUrl.startsWith('assets/');

  bool get _isSvg {
    final u = _uri;
    final path = (u?.path.isNotEmpty ?? false) ? u!.path : imageUrl;
    return path.toLowerCase().endsWith('.svg');
  }

  String get _filePath =>
      _isFileScheme ? Uri.parse(imageUrl).toFilePath() : imageUrl;

  // ----- builders for images -----
  Widget _buildRaster() {
    if (_isNetwork) {
      return Image.network(
        imageUrl,
        fit: BoxFit.contain,
        loadingBuilder: (c, child, progress) {
          if (progress == null) return child;
          final total = progress.expectedTotalBytes;
          final loaded = progress.cumulativeBytesLoaded;
          return Center(
            child: SizedBox(
              width: 56,
              height: 56,
              child: CircularProgressIndicator(
                value: total != null ? loaded / total : null,
              ),
            ),
          );
        },
        errorBuilder: (_, _, _) =>
        const _ErrorPlaceholder(),
      );
    }
    if (_isAsset) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => const _ErrorPlaceholder(),
      );
    }
    if (_isFileScheme || _isAbsolutePath) {
      return Image.file(
        File(_filePath),
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => const _ErrorPlaceholder(),
      );
    }
    // fallback: try asset
    return Image.asset(
      imageUrl,
      fit: BoxFit.contain,
      errorBuilder: (_, _, _) => const _ErrorPlaceholder(),
    );
  }

  Widget _buildSvg() {
    if (_isNetwork) {
      return SvgPicture.network(
        imageUrl,
        fit: BoxFit.contain,
        placeholderBuilder: (_) => const _Loading(),
      );
    }
    if (_isAsset) {
      return SvgPicture.asset(
        imageUrl,
        fit: BoxFit.contain,
        placeholderBuilder: (_) => const _Loading(),
      );
    }
    if (_isFileScheme || _isAbsolutePath) {
      return SvgPicture.file(
        File(_filePath),
        fit: BoxFit.contain,
        placeholderBuilder: (_) => const _Loading(),
      );
    }
    // fallback: try asset
    return SvgPicture.asset(
      imageUrl,
      fit: BoxFit.contain,
      placeholderBuilder: (_) => const _Loading(),
    );
  }

  Widget _buildImage() {
    final core = _isSvg ? _buildSvg() : _buildRaster();
    return heroTag == null ? core : Hero(tag: heroTag!, child: core);
  }

  @override
  Widget build(BuildContext context) {
    Log.warning("ViewFullImage: imageUrl: $imageUrl, "
        "isNetwork: $_isNetwork, isFileScheme: $_isFileScheme, "
        "isAbsolutePath: $_isAbsolutePath, isAsset: $_isAsset, "
        "isSvg: $_isSvg");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).maybePop(),
        child: SafeArea(
          child: Center(
            child: InteractiveViewer(
              maxScale: 6,
              minScale: 0.5,
              clipBehavior: Clip.none,
              child: _buildImage(),
            ),
          ),
        ),
      ),
    );
  }
}

// ---- small UI helpers ----
class _Loading extends StatelessWidget {
  const _Loading();
  @override
  Widget build(BuildContext context) =>
      const SizedBox(width: 56, height: 56, child: CircularProgressIndicator());
}

class _ErrorPlaceholder extends StatelessWidget {
  const _ErrorPlaceholder();
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.broken_image, color: Colors.white70, size: 48),
      SizedBox(height: 8),
      Text('Failed to load image', style: TextStyle(color: Colors.white70)),
    ],
  );
}
