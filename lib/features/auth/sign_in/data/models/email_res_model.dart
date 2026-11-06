import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_res_model.freezed.dart';
part 'email_res_model.g.dart';

@freezed
abstract class EmailResModel with _$EmailResModel {
  const factory EmailResModel({required String email}) = _EmailResModel;

  factory EmailResModel.fromJson(Map<String, dynamic> json) =>
      _$EmailResModelFromJson(json);
}
