import 'dart:developer';
import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:sixty_ix/modules/art_core/art_core.dart';
import 'package:sixty_ix/modules/core/enums/file_types.dart';
import 'package:sixty_ix/modules/shared/data/repositories/shared_repository.dart';

import '../../shared/data/models/upload_docs/upload_document_model.dart';
import '../../shared/data/models/upload_docs/upload_document_params.dart';

class FileUploadService {
  final SharedRepository uploadDocument = Modular.get<SharedRepository>();
  final FileTypes fileNameType;

  FileUploadService({this.fileNameType = FileTypes.profilePicture});

  Future<Map<String, dynamic>?> uploadFile({
    required File file,
  }) async {
    try {
      final result = await uploadDocument.uploadDocument(
        uploadDocumentParams: UploadDocumentParams(
          file: file,
          fileType: fileNameType,
        ),
      );

      return result.fold(
        (failure) {
          log("Upload failed: $failure");
          AppToast.error(
             "Upload failed: $failure",
          );
          return null;
        },
        (success) {
          AppToast.success(
             "Upload Successful",
          );
          return {'id': success.model?.id, 'path': success.model?.path ?? ""};
        },
      );
    } catch (e) {
      log("An error occurred: $e");
      AppToast.error(
        "An error occurred: $e",
      );
      return null;
    }
  }

  Future<List<UploadDocumentModel>?> uploadMultipleFiles({
    required List<File> files,
  }) async {
    try {
      final formData =
          UploadDocumentParams(
            fileType: fileNameType,
            files: files,
          ).toMultipleServer();

      final res = await uploadDocument.uploadMultipleDocuments(formData);

      return res.fold(
        (failure) {
          AppToast.error(
            "Upload failed: ${failure.errorMassage}",
          );
          return null;
        },
        (success) {
          AppToast.success(
            "تم رفع جميع الملفات بنجاح",
          );
          return success;
        },
      );
    } catch (e) {
      log("Upload many error: $e");
      AppToast.error(
        "حدث خطأ أثناء الرفع",
      );
    }
    return null;
  }
}
