enum ReportableType {
  post('post'),
  comment('comment');

  const ReportableType(this.value);

  final String value;

  // Convert from string to enum
  static ReportableType? fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'post':
        return ReportableType.post;
      case 'comment':
        return ReportableType.comment;
      default:
        return null;
    }
  }


  @override
  String toString() => value;

  // Helper method to get display name
  String get displayName {
    switch (this) {
      case ReportableType.post:
        return 'Post';
      case ReportableType.comment:
        return 'Comment';
    }
  }
}