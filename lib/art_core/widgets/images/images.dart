import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:croppy/croppy.dart' as cropper;
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:hl_image_picker/hl_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart'; // Add this dependency
import 'package:shimmer/shimmer.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:uuid/uuid.dart';

part 'app_image.dart';
part 'view_full_image.dart';

part 'pick_avatar.dart';
