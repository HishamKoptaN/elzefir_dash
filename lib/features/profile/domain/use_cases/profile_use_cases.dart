import 'package:injectable/injectable.dart';

import '../../../../core/errors/models/error_info.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/profile_entity.dart';
import '../entities/update_profile_req_entity.dart';
import '../repo/profile_repo.dart';

@lazySingleton
class ProfileUseCases {
  final ProfileRepo _profileRepo;
  const ProfileUseCases(this._profileRepo);
  Future<ApiResult<ProfileEntity>> getProfile() async {
    return await _profileRepo.getProfile();
  }

  Future<ApiResult<ProfileEntity>> updateProfile({
    required UpdateProfileReqEntity updateProfileReqEntity,
  }) async {
    if (updateProfileReqEntity.avatar != null) {
      final result = await _profileRepo.presignedAvatarUrl(
        extension: updateProfileReqEntity.avatar!.path.split('.').last,
      );

      return await result.when(
        success: (s3Info) async {
          try {
            return await _profileRepo.updateProfile(
              updateProfileReqEntity: updateProfileReqEntity.copyWith(
                avatarPath: s3Info?.filePath,
              ),
            );
          } catch (e) {
            return ApiResult.failure(
              errorInfo: ErrorInfo(message: 'Failed to upload avatar'),
            );
          }
        },
        failure: (failure) {
          return ApiResult.failure(errorInfo: failure);
        },
      );
    } else {
      return await _profileRepo.updateProfile(
        updateProfileReqEntity: updateProfileReqEntity,
      );
    }
  }
}
