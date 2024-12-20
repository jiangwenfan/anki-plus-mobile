import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class LoginEmailPwd with _$LoginEmailPwd {
  const factory LoginEmailPwd({
    required String email,
    required String password,
  }) = _LoginEmailPwd;

  factory LoginEmailPwd.fromJson(Map<String, dynamic> json) =>
      _$LoginEmailPwdFromJson(json);
}
