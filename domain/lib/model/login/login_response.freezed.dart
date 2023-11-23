// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  int get sCode => throw _privateConstructorUsedError;
  String get sMessage => throw _privateConstructorUsedError;
  List<LoginResponseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({int sCode, String sMessage, List<LoginResponseData> data});
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sCode = null,
    Object? sMessage = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      sCode: null == sCode
          ? _value.sCode
          : sCode // ignore: cast_nullable_to_non_nullable
              as int,
      sMessage: null == sMessage
          ? _value.sMessage
          : sMessage // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LoginResponseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sCode, String sMessage, List<LoginResponseData> data});
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sCode = null,
    Object? sMessage = null,
    Object? data = null,
  }) {
    return _then(_$LoginResponseImpl(
      sCode: null == sCode
          ? _value.sCode
          : sCode // ignore: cast_nullable_to_non_nullable
              as int,
      sMessage: null == sMessage
          ? _value.sMessage
          : sMessage // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LoginResponseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  _$LoginResponseImpl(
      {required this.sCode,
      required this.sMessage,
      required final List<LoginResponseData> data})
      : _data = data;

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final int sCode;
  @override
  final String sMessage;
  final List<LoginResponseData> _data;
  @override
  List<LoginResponseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LoginResponse(sCode: $sCode, sMessage: $sMessage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.sCode, sCode) || other.sCode == sCode) &&
            (identical(other.sMessage, sMessage) ||
                other.sMessage == sMessage) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, sCode, sMessage, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  factory _LoginResponse(
      {required final int sCode,
      required final String sMessage,
      required final List<LoginResponseData> data}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  int get sCode;
  @override
  String get sMessage;
  @override
  List<LoginResponseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) {
  return _LoginResponseData.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseData {
  UserInfo? get userInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseDataCopyWith<LoginResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseDataCopyWith<$Res> {
  factory $LoginResponseDataCopyWith(
          LoginResponseData value, $Res Function(LoginResponseData) then) =
      _$LoginResponseDataCopyWithImpl<$Res, LoginResponseData>;
  @useResult
  $Res call({UserInfo? userInfo});

  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$LoginResponseDataCopyWithImpl<$Res, $Val extends LoginResponseData>
    implements $LoginResponseDataCopyWith<$Res> {
  _$LoginResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseDataImplCopyWith<$Res>
    implements $LoginResponseDataCopyWith<$Res> {
  factory _$$LoginResponseDataImplCopyWith(_$LoginResponseDataImpl value,
          $Res Function(_$LoginResponseDataImpl) then) =
      __$$LoginResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserInfo? userInfo});

  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$LoginResponseDataImplCopyWithImpl<$Res>
    extends _$LoginResponseDataCopyWithImpl<$Res, _$LoginResponseDataImpl>
    implements _$$LoginResponseDataImplCopyWith<$Res> {
  __$$LoginResponseDataImplCopyWithImpl(_$LoginResponseDataImpl _value,
      $Res Function(_$LoginResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(_$LoginResponseDataImpl(
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseDataImpl implements _LoginResponseData {
  _$LoginResponseDataImpl({this.userInfo});

  factory _$LoginResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseDataImplFromJson(json);

  @override
  final UserInfo? userInfo;

  @override
  String toString() {
    return 'LoginResponseData(userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseDataImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseDataImplCopyWith<_$LoginResponseDataImpl> get copyWith =>
      __$$LoginResponseDataImplCopyWithImpl<_$LoginResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseDataImplToJson(
      this,
    );
  }
}

abstract class _LoginResponseData implements LoginResponseData {
  factory _LoginResponseData({final UserInfo? userInfo}) =
      _$LoginResponseDataImpl;

  factory _LoginResponseData.fromJson(Map<String, dynamic> json) =
      _$LoginResponseDataImpl.fromJson;

  @override
  UserInfo? get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseDataImplCopyWith<_$LoginResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  String get id => throw _privateConstructorUsedError;
  String get uname => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get cader => throw _privateConstructorUsedError;
  String get cadername => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get createDt => throw _privateConstructorUsedError;
  String get modifyDt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  int get underscoreV => throw _privateConstructorUsedError;
  String get secure => throw _privateConstructorUsedError;
  int get loggTime => throw _privateConstructorUsedError;
  UserCader? get userCader => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {String id,
      String uname,
      String password,
      String gender,
      String description,
      String cader,
      String cadername,
      String department,
      String createDt,
      String modifyDt,
      bool active,
      int underscoreV,
      String secure,
      int loggTime,
      UserCader? userCader});

  $UserCaderCopyWith<$Res>? get userCader;
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uname = null,
    Object? password = null,
    Object? gender = null,
    Object? description = null,
    Object? cader = null,
    Object? cadername = null,
    Object? department = null,
    Object? createDt = null,
    Object? modifyDt = null,
    Object? active = null,
    Object? underscoreV = null,
    Object? secure = null,
    Object? loggTime = null,
    Object? userCader = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uname: null == uname
          ? _value.uname
          : uname // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cader: null == cader
          ? _value.cader
          : cader // ignore: cast_nullable_to_non_nullable
              as String,
      cadername: null == cadername
          ? _value.cadername
          : cadername // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      createDt: null == createDt
          ? _value.createDt
          : createDt // ignore: cast_nullable_to_non_nullable
              as String,
      modifyDt: null == modifyDt
          ? _value.modifyDt
          : modifyDt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      underscoreV: null == underscoreV
          ? _value.underscoreV
          : underscoreV // ignore: cast_nullable_to_non_nullable
              as int,
      secure: null == secure
          ? _value.secure
          : secure // ignore: cast_nullable_to_non_nullable
              as String,
      loggTime: null == loggTime
          ? _value.loggTime
          : loggTime // ignore: cast_nullable_to_non_nullable
              as int,
      userCader: freezed == userCader
          ? _value.userCader
          : userCader // ignore: cast_nullable_to_non_nullable
              as UserCader?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCaderCopyWith<$Res>? get userCader {
    if (_value.userCader == null) {
      return null;
    }

    return $UserCaderCopyWith<$Res>(_value.userCader!, (value) {
      return _then(_value.copyWith(userCader: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String uname,
      String password,
      String gender,
      String description,
      String cader,
      String cadername,
      String department,
      String createDt,
      String modifyDt,
      bool active,
      int underscoreV,
      String secure,
      int loggTime,
      UserCader? userCader});

  @override
  $UserCaderCopyWith<$Res>? get userCader;
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uname = null,
    Object? password = null,
    Object? gender = null,
    Object? description = null,
    Object? cader = null,
    Object? cadername = null,
    Object? department = null,
    Object? createDt = null,
    Object? modifyDt = null,
    Object? active = null,
    Object? underscoreV = null,
    Object? secure = null,
    Object? loggTime = null,
    Object? userCader = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uname: null == uname
          ? _value.uname
          : uname // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cader: null == cader
          ? _value.cader
          : cader // ignore: cast_nullable_to_non_nullable
              as String,
      cadername: null == cadername
          ? _value.cadername
          : cadername // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      createDt: null == createDt
          ? _value.createDt
          : createDt // ignore: cast_nullable_to_non_nullable
              as String,
      modifyDt: null == modifyDt
          ? _value.modifyDt
          : modifyDt // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      underscoreV: null == underscoreV
          ? _value.underscoreV
          : underscoreV // ignore: cast_nullable_to_non_nullable
              as int,
      secure: null == secure
          ? _value.secure
          : secure // ignore: cast_nullable_to_non_nullable
              as String,
      loggTime: null == loggTime
          ? _value.loggTime
          : loggTime // ignore: cast_nullable_to_non_nullable
              as int,
      userCader: freezed == userCader
          ? _value.userCader
          : userCader // ignore: cast_nullable_to_non_nullable
              as UserCader?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  _$UserInfoImpl(
      {required this.id,
      required this.uname,
      required this.password,
      required this.gender,
      required this.description,
      required this.cader,
      required this.cadername,
      required this.department,
      required this.createDt,
      required this.modifyDt,
      required this.active,
      required this.underscoreV,
      required this.secure,
      required this.loggTime,
      this.userCader});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String uname;
  @override
  final String password;
  @override
  final String gender;
  @override
  final String description;
  @override
  final String cader;
  @override
  final String cadername;
  @override
  final String department;
  @override
  final String createDt;
  @override
  final String modifyDt;
  @override
  final bool active;
  @override
  final int underscoreV;
  @override
  final String secure;
  @override
  final int loggTime;
  @override
  final UserCader? userCader;

  @override
  String toString() {
    return 'UserInfo(id: $id, uname: $uname, password: $password, gender: $gender, description: $description, cader: $cader, cadername: $cadername, department: $department, createDt: $createDt, modifyDt: $modifyDt, active: $active, underscoreV: $underscoreV, secure: $secure, loggTime: $loggTime, userCader: $userCader)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uname, uname) || other.uname == uname) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cader, cader) || other.cader == cader) &&
            (identical(other.cadername, cadername) ||
                other.cadername == cadername) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.createDt, createDt) ||
                other.createDt == createDt) &&
            (identical(other.modifyDt, modifyDt) ||
                other.modifyDt == modifyDt) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.underscoreV, underscoreV) ||
                other.underscoreV == underscoreV) &&
            (identical(other.secure, secure) || other.secure == secure) &&
            (identical(other.loggTime, loggTime) ||
                other.loggTime == loggTime) &&
            (identical(other.userCader, userCader) ||
                other.userCader == userCader));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uname,
      password,
      gender,
      description,
      cader,
      cadername,
      department,
      createDt,
      modifyDt,
      active,
      underscoreV,
      secure,
      loggTime,
      userCader);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  factory _UserInfo(
      {required final String id,
      required final String uname,
      required final String password,
      required final String gender,
      required final String description,
      required final String cader,
      required final String cadername,
      required final String department,
      required final String createDt,
      required final String modifyDt,
      required final bool active,
      required final int underscoreV,
      required final String secure,
      required final int loggTime,
      final UserCader? userCader}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get uname;
  @override
  String get password;
  @override
  String get gender;
  @override
  String get description;
  @override
  String get cader;
  @override
  String get cadername;
  @override
  String get department;
  @override
  String get createDt;
  @override
  String get modifyDt;
  @override
  bool get active;
  @override
  int get underscoreV;
  @override
  String get secure;
  @override
  int get loggTime;
  @override
  UserCader? get userCader;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserCader _$UserCaderFromJson(Map<String, dynamic> json) {
  return _UserCader.fromJson(json);
}

/// @nodoc
mixin _$UserCader {
  String get id => throw _privateConstructorUsedError;
  String get cdname => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCaderCopyWith<UserCader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCaderCopyWith<$Res> {
  factory $UserCaderCopyWith(UserCader value, $Res Function(UserCader) then) =
      _$UserCaderCopyWithImpl<$Res, UserCader>;
  @useResult
  $Res call({String id, String cdname, bool active, String code});
}

/// @nodoc
class _$UserCaderCopyWithImpl<$Res, $Val extends UserCader>
    implements $UserCaderCopyWith<$Res> {
  _$UserCaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cdname = null,
    Object? active = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cdname: null == cdname
          ? _value.cdname
          : cdname // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCaderImplCopyWith<$Res>
    implements $UserCaderCopyWith<$Res> {
  factory _$$UserCaderImplCopyWith(
          _$UserCaderImpl value, $Res Function(_$UserCaderImpl) then) =
      __$$UserCaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String cdname, bool active, String code});
}

/// @nodoc
class __$$UserCaderImplCopyWithImpl<$Res>
    extends _$UserCaderCopyWithImpl<$Res, _$UserCaderImpl>
    implements _$$UserCaderImplCopyWith<$Res> {
  __$$UserCaderImplCopyWithImpl(
      _$UserCaderImpl _value, $Res Function(_$UserCaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cdname = null,
    Object? active = null,
    Object? code = null,
  }) {
    return _then(_$UserCaderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cdname: null == cdname
          ? _value.cdname
          : cdname // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCaderImpl implements _UserCader {
  _$UserCaderImpl(
      {required this.id,
      required this.cdname,
      required this.active,
      required this.code});

  factory _$UserCaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCaderImplFromJson(json);

  @override
  final String id;
  @override
  final String cdname;
  @override
  final bool active;
  @override
  final String code;

  @override
  String toString() {
    return 'UserCader(id: $id, cdname: $cdname, active: $active, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCaderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cdname, cdname) || other.cdname == cdname) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cdname, active, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCaderImplCopyWith<_$UserCaderImpl> get copyWith =>
      __$$UserCaderImplCopyWithImpl<_$UserCaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCaderImplToJson(
      this,
    );
  }
}

abstract class _UserCader implements UserCader {
  factory _UserCader(
      {required final String id,
      required final String cdname,
      required final bool active,
      required final String code}) = _$UserCaderImpl;

  factory _UserCader.fromJson(Map<String, dynamic> json) =
      _$UserCaderImpl.fromJson;

  @override
  String get id;
  @override
  String get cdname;
  @override
  bool get active;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$UserCaderImplCopyWith<_$UserCaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
