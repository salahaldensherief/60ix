enum FileTypes { profilePicture , comment , postGallery }

extension FileTypesExtention on FileTypes {
  String get fileType {
    switch (this) {
      case FileTypes.profilePicture:
        return 'profile_picture';
      case FileTypes.comment:
        return 'comment';
      case FileTypes.postGallery:
        return 'post_gallery';
    }
  }
}
