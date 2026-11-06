import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/presigned_url_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/update_profile_req_entity.dart';
import '../../domain/repo/profile_repo.dart';
import '../datasources/profile_api.dart';
import '../mappers/profile_model_mapper.dart';
import '../models/presigned_url_req_model.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileApi _profileApi;
  final FirebaseAuth _firebaseAuth;
  const ProfileRepoImpl(this._profileApi, this._firebaseAuth);
  @override
  Future<ApiResult<ProfileEntity>> getProfile() async {
    try {
      final result = await _profileApi.getProfile();
      final firebaseUser = _firebaseAuth.currentUser;
      final email = firebaseUser?.email;
      final profileEntity = result.toEntity().copyWith(email: email ?? '');
      return ApiResult.success(data: profileEntity);
    } catch (e, s) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<ApiResult<PresignedUrlEntity>> presignedAvatarUrl({
    required String extension,
  }) async {
    try {
      final result = await _profileApi.presignedAvatarUrl(
        presignedUrlReqModel: PresignedUrlReqModel(
          extensionProperty: extension,
        ),
      );
      return ApiResult.success(data: result.toEntity());
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }

  @override
  Future<ApiResult<ProfileEntity>> updateProfile({
    required UpdateProfileReqEntity updateProfileReqEntity,
  }) async {
    try {
      final res = await _profileApi.updateProfile(
        updateProfileReqModel: updateProfileReqEntity.toModel(),
      );
      return ApiResult.success(
        data: res.toEntity().copyWith(
          email: _firebaseAuth.currentUser?.email ?? '',
        ),
      );
    } catch (e, st) {
      return ApiResult.failure(errorInfo: ErrorHandler.handle(e, st));
    }
  }
}
