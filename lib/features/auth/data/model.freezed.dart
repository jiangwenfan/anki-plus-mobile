// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginEmailPwd _$LoginEmailPwdFromJson(Map<String, dynamic> json) {
  return _LoginEmailPwd.fromJson(json);
}

/// @nodoc
mixin _$LoginEmailPwd {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginEmailPwd to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginEmailPwd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEmailPwdCopyWith<LoginEmailPwd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEmailPwdCopyWith<$Res> {
  factory $LoginEmailPwdCopyWith(
          LoginEmailPwd value, $Res Function(LoginEmailPwd) then) =
      _$LoginEmailPwdCopyWithImpl<$Res, LoginEmailPwd>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginEmailPwdCopyWithImpl<$Res, $Val extends LoginEmailPwd>
    implements $LoginEmailPwdCopyWith<$Res> {
  _$LoginEmailPwdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEmailPwd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginEmailPwdImplCopyWith<$Res>
    implements $LoginEmailPwdCopyWith<$Res> {
  factory _$$LoginEmailPwdImplCopyWith(
          _$LoginEmailPwdImpl value, $Res Function(_$LoginEmailPwdImpl) then) =
      __$$LoginEmailPwdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginEmailPwdImplCopyWithImpl<$Res>
    extends _$LoginEmailPwdCopyWithImpl<$Res, _$LoginEmailPwdImpl>
    implements _$$LoginEmailPwdImplCopyWith<$Res> {
  __$$LoginEmailPwdImplCopyWithImpl(
      _$LoginEmailPwdImpl _value, $Res Function(_$LoginEmailPwdImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEmailPwd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginEmailPwdImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginEmailPwdImpl
    with DiagnosticableTreeMixin
    implements _LoginEmailPwd {
  const _$LoginEmailPwdImpl({required this.email, required this.password});

  factory _$LoginEmailPwdImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginEmailPwdImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginEmailPwd(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginEmailPwd'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEmailPwdImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginEmailPwd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEmailPwdImplCopyWith<_$LoginEmailPwdImpl> get copyWith =>
      __$$LoginEmailPwdImplCopyWithImpl<_$LoginEmailPwdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginEmailPwdImplToJson(
      this,
    );
  }
}

abstract class _LoginEmailPwd implements LoginEmailPwd {
  const factory _LoginEmailPwd(
      {required final String email,
      required final String password}) = _$LoginEmailPwdImpl;

  factory _LoginEmailPwd.fromJson(Map<String, dynamic> json) =
      _$LoginEmailPwdImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginEmailPwd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginEmailPwdImplCopyWith<_$LoginEmailPwdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
