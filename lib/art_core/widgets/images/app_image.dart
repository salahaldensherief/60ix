part of 'images.dart';

class AppImage extends StatelessWidget {
  /// The URL or path of the image (e.g., HTTP URL, asset path, or file path).
  final String urlImg;

  /// Optional height of the image.
  final double? height;

  /// Optional width of the image.
  final double? width;

  /// Widget to display if the image fails to load.
  final Widget? errorWidget;

  /// Widget to display while the image is loading.
  final Widget? placeholderWidget;

  /// How the image should be inscribed into the available space.
  final BoxFit fit;

  /// Border radius for the image container.
  final double borderRadius;

  /// Optional border color for the error or placeholder container.
  final Color? borderColor;

  /// Optional color filter to apply to the image.
  final Color? color;

  /// Optional background color for the image container.
  final Color? backgroundColor;

  /// Optional shape of the image container (e.g., circle or rectangle).
  final BoxShape? boxShape;

  /// Enable zoom functionality when tapping the image.
  final bool enableZoom, useFirstNameIfError;

  /// Minimum scale for zooming.
  final double minScale;

  /// Maximum scale for zooming.
  final double maxScale;

  /// Initial scale when zoomed.
  final double initialScale;

  final String? errorImagePath, nameIfError;

  const AppImage({
    super.key,
    this.urlImg = '',
    this.height,
    this.width,
    this.errorWidget,
    this.placeholderWidget,
    this.fit = BoxFit.contain,
    this.borderRadius = 8.0,
    this.borderColor,
    this.color,
    this.boxShape,
    this.errorImagePath,
    this.nameIfError,
    this.enableZoom = false,
    this.useFirstNameIfError = false,
    this.minScale = 0.8,
    this.maxScale = 3.0,
    this.initialScale = 1.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: backgroundColor,
        width: width,
        height: height,
        child:
            enableZoom
                ? GestureDetector(
                  onTap: () => _showZoomDialog(context),
                  child: _buildImageBasedOnSource(),
                )
                : _buildImageBasedOnSource(),
      ),
    );
  }

  /// Shows a dialog with zoomable image only
  void _showZoomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder:
          (context, anim1, anim2) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                PhotoView(
                  imageProvider: _getImageProvider(),
                  minScale: PhotoViewComputedScale.contained * minScale,
                  maxScale: PhotoViewComputedScale.covered * maxScale,
                  initialScale: PhotoViewComputedScale.contained * initialScale,
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  heroAttributes: const PhotoViewHeroAttributes(tag: 'image'),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.8,
              end: 1.0,
            ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
            child: child,
          ),
        );
      },
    );
  }

  /// Determines the appropriate ImageProvider based on the source
  ImageProvider _getImageProvider() {
    if (urlImg.startsWith('http')) {
      return NetworkImage(urlImg);
    } else if (urlImg.startsWith('assets')) {
      return AssetImage(urlImg);
    } else {
      return FileImage(File(urlImg));
    }
  }

  /// Determines the image source and delegates to the appropriate builder.
  Widget _buildImageBasedOnSource() {
    if (urlImg.trim().isEmpty) {
      return _buildError();
    }
    if (urlImg.startsWith('http')) {
      return _buildNetworkImage();
    }
    return _buildLocalImage();
  }

  /// Builds the network image using CachedNetworkImage.
  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: urlImg,
      width: width,
      height: height,
      fit: fit,
      color: color,
      placeholder: (_, __) => placeholderWidget ?? _buildPlaceholder(),
      errorWidget: (_, __, ___) => errorWidget ?? _buildError(),
      fadeInDuration: const Duration(milliseconds: 500),
    );
  }

  /// Builds the local image (asset or file) based on the path.
  Widget _buildLocalImage({String? path}) {
    final isAsset =
        urlImg.startsWith('assets') || (path?.startsWith('assets') ?? false);
    final imageWidget =
        isAsset
            ? Image.asset(
              path ?? urlImg,
              width: width,
              height: height,
              fit: fit,
              color: color,
              errorBuilder: (_, __, ___) => errorWidget ?? _buildError(),
            )
            : Image.file(
              File(urlImg),
              width: width,
              height: height,
              fit: fit,
              color: color,
              errorBuilder: (_, __, ___) => errorWidget ?? _buildError(),
            );
    return imageWidget;
  }

  /// Builds a shimmer placeholder while the image loads.
  Widget _buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          shape: boxShape ?? BoxShape.rectangle,
        ),
      ),
    );
  }

  /// Builds an error widgets if the image fails to load or the URL is invalid.
  Widget _buildError() {
    if (errorWidget != null) {
      return errorWidget!;
    }
    if (useFirstNameIfError) {
      return _buildImageForFirstName();
    }
    if (errorImagePath != null && errorImagePath!.isNotEmpty) {
      return _buildLocalImage(path: errorImagePath);
    }
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: borderColor?.withAlpha(64) ?? Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(borderRadius),
        shape: boxShape ?? BoxShape.rectangle,
      ),
      child: FittedBox(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
          size: (height ?? 150) * 0.3,
        ),
      ),
    );
  }

  Widget _buildImageForFirstName() {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: borderColor?.withAlpha(64) ?? Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(borderRadius),
        shape: boxShape ?? BoxShape.rectangle,
      ),
      child: FittedBox(
        child: AppText(
          text: nameIfError?.substring(0, 1).toUpperCase() ?? "G",
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
      ),
    );
  }
}
