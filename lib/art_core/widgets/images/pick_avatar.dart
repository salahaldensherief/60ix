part of 'images.dart';

class PickAvatar extends StatefulWidget {
  final Function(File) onImageChanged;
  final String? imageUrl;

  const PickAvatar({super.key, required this.onImageChanged, this.imageUrl});

  @override
  State<PickAvatar> createState() => _PickAvatarState();
}

class _PickAvatarState extends State<PickAvatar> {
  File? _selectedImage; // Stores the selected image

  // Pick image using HLImagePicker
  // Future<void> _pickImage() async {
  //   try {
  //     final _picker = HLImagePicker();
  //     final images = await _picker.openPicker(pickerOptions: HLPickerOptions());
  //     if (images.isNotEmpty) {
  //       File selectedFile = File(images.first.path);
  //       File? croppedFile = await _cropImage(selectedFile);
  //       if (croppedFile != null) {
  //         File? compressedFile = await _compressImage(croppedFile);
  //         if (compressedFile != null) {
  //           setState(() {
  //             _selectedImage = compressedFile;
  //           });
  //           widgets.onImageChanged(compressedFile);
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print("Failed to pick image: $e");
  //   }
  // }


  Future<void> _pickImage() async {
    try {
      final _picker = ImagePicker();
      final images = await _picker.pickImage(source: ImageSource.gallery);
      if (images != null ) {
        File selectedFile = File(images.path);
        File? croppedFile = await _cropImage(selectedFile);
        if (croppedFile != null) {
          File? compressedFile = await _compressImage(croppedFile);
          if (compressedFile != null) {
            setState(() {
              _selectedImage = compressedFile;
            });
            widget.onImageChanged(compressedFile);
          }
        }
      }
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    final result = await cropper.showCupertinoImageCropper(
      context,
      imageProvider: FileImage(imageFile),
      allowedAspectRatios: [cropper.CropAspectRatio(width: 100, height: 100)],
    );
    if (result != null) {
      return _saveCroppedImage(result.uiImage);
    }
    return null;
  }

  /// 🔹 Convert `ui.Image` to File
  Future<File> _saveCroppedImage(ui.Image image) async {
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final Uint8List imageBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final croppedFile = File('${directory.path}/${Uuid().v4()}.png');
    await croppedFile.writeAsBytes(imageBytes);

    return croppedFile;
  }

  // Generate a temporary path for compressed images
  Future<String> _getTargetPath(String fileName) async {
    final tempDir = await getTemporaryDirectory();
    return "${tempDir.path}/$fileName";
  }

  // Compress the selected image
  Future<File?> _compressImage(File file) async {
    try {
      final targetPath = await _getTargetPath("${const Uuid().v4()}.jpg");
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 95,
      );
      return result != null ? File(result.path) : null;
    } catch (e) {
      print("Image compression failed: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Center(
        child:
            _selectedImage != null
                ? CircleAvatar(
                  radius: 80,
                  backgroundImage: ResizeImage(
                    FileImage(_selectedImage!),
                    width: 400,
                    height: 400,
                  ),
                )
                : widget.imageUrl != null
                ? CircleAvatar(
                  radius: 80,
                  backgroundImage: ResizeImage(
                    NetworkImage(widget.imageUrl!),
                    width: 400,
                    height: 400,
                  ),
                )
                : SvgPicture.asset("assets/icons/add_image.svg", width: 80),
      ),
    );
  }
}
