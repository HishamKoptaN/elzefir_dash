import 'package:form_inputs/form_inputs.dart';

import '../../../../core/utils/date/date_formatter.dart';
import '../../domain/entities/presigned_url_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/update_profile_req_entity.dart';
import '../models/presigned_url_model.dart';
import '../models/profile_res_model.dart';
import '../models/update_profile_req_model.dart';

extension ProfileModelX on ProfileResModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id ?? 0,
      avatar: avatar ?? '',
      name: GenericFormInput.dirty(value: name ?? ''),
      username: UsernameFormInput.dirty(username ?? ''),
      phoneNumber: GenericFormInput.dirty(value: phoneNumber ?? ''),
      dialCode: GenericFormInput.dirty(value: dialCode ?? ''),
      isoCode: GenericFormInput.dirty(value: isoCode ?? ''),
      createdAt: formatDate(dateTime: createdAt),
      email: email ?? '',
    );
  }
}

extension UpdateProfileReqX on UpdateProfileReqEntity {
  UpdateProfileReqModel toModel() {
    return UpdateProfileReqModel(
      avatar: avatarPath,
      name: name,
      username: username,
      phoneNumber: phoneNumber,
      dialCode: dialCode,
      isoCode: isoCode,
    );
  }
}

extension PresignedUrlX on PresignedUrlModel {
  PresignedUrlEntity toEntity() {
    return PresignedUrlEntity(
      uploadUrl: uploadUrl,
      filePath: filePath,
      contentType: contentType,
    );
  }
}
