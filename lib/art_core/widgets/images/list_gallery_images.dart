import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/art_core/widgets/text/app_text.dart';
import 'package:sixty_ix/modules/core/translate/translate.dart';

class ListGalleryImages extends StatelessWidget {
  final List<String> images;

  const ListGalleryImages({super.key, required this.images});

  @override
  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    if (images.length == 1) {
      return _cardImage(
        imageUrl: images[0],
        fullSize: true,
        index: 0,
        allImages: images,
        context: context,
      );
    }

    if (images.length == 2) {
      return SizedBox(
        height: 164.h,
        child: Row(
          children: [
            Expanded(
              child: _cardImage(
                imageUrl: images[0],
                fullSize: true,
                index: 0,
                allImages: images,
                context: context,
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: _cardImage(
                imageUrl: images[1],
                fullSize: true,
                index: 1,
                allImages: images,
                context: context,
              ),
            ),
          ],
        ),
      );
    }

    // 3 or more
    return SizedBox(
      height: 164.h,
      child: Row(
        children: [
          /// Left large image
          Expanded(
            child: _cardImage(
              imageUrl: images[0],
              fullSize: true,
              index: 0,
              allImages: images,
              context: context,
            ),
          ),
          SizedBox(width: 4.w),

          /// Right stacked column
          Expanded(
            child: Column(
              children: [
                _cardImage(
                  imageUrl: images[1],
                  smallSize: true,
                  index: 1,
                  allImages: images,
                  context: context,
                ),
                SizedBox(height: 4.h),
                _cardImage(
                  imageUrl: images[2],
                  smallSize: true,
                  index: 2,
                  allImages: images,
                  context: context,
                  count:
                      images.length > 3 ? (images.length - 3).toString() : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _cardImage({
    required String imageUrl,
    required BuildContext context,
    bool fullSize = false,
    bool smallSize = false,
    String? count,
    int? index, // add index
    List<String>? allImages, // add list
  }) {
    return GestureDetector(
      onTap: () {
        if (allImages != null && index != null) {
          _openImageViewer(
            images: allImages,
            initialIndex: index,
            context: context,
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: fullSize ? 164.h : 80.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                  opacity: count == null ? 1 : 0.9,
                ),
              ),
            ),
            if (count != null)
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.6),
                  child: AppText(
                    text: '+$count',
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _openImageViewer({
    required List<String> images,
    required int initialIndex,
    required BuildContext context,
  }) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black,
      barrierDismissible: true,
      barrierLabel: 'ImageViewer',
      pageBuilder: (context, animation, secondaryAnimation) {
        final pageController = PageController(initialPage: initialIndex);
        int currentIndex = initialIndex;

        return StatefulBuilder(
          builder: (context, setState) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return PhotoView(
                        backgroundDecoration:
                        const BoxDecoration(color: Colors.black),
                        imageProvider: CachedNetworkImageProvider(images[index]),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2,
                      );
                    },
                  ),

                  Positioned(
                    bottom: 60.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: AppText(
                        text: '${currentIndex + 1} ${translate(AppString.of)} ${images.length}',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 45.h,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child:
                      const Icon(Icons.close, color: Colors.white, size: 28),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


}
