// Mocks generated by Mockito 5.3.2 from annotations
// in nartus_storage/test/src/impl/local/local_storage_service_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nartus_storage/nartus_storage.dart' as _i2;
import 'package:nartus_storage/src/impl/local/hive/hive_local_storage.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDiaryCollection_0 extends _i1.SmartFake
    implements _i2.DiaryCollection {
  _FakeDiaryCollection_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_1 extends _i1.SmartFake implements _i2.User {
  _FakeUser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HiveLocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveLocalStorage extends _i1.Mock implements _i3.HiveLocalStorage {
  MockHiveLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> deleteDiary(int? timestamp) => (super.noSuchMethod(
        Invocation.method(
          #deleteDiary,
          [timestamp],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.DiaryCollection> readDiaryForMonth(DateTime? month) =>
      (super.noSuchMethod(
        Invocation.method(
          #readDiaryForMonth,
          [month],
        ),
        returnValue:
            _i4.Future<_i2.DiaryCollection>.value(_FakeDiaryCollection_0(
          this,
          Invocation.method(
            #readDiaryForMonth,
            [month],
          ),
        )),
      ) as _i4.Future<_i2.DiaryCollection>);
  @override
  _i4.Future<void> saveDiary(_i2.Diary? diary) => (super.noSuchMethod(
        Invocation.method(
          #saveDiary,
          [diary],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<bool> deleteUser(String? uid) => (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [uid],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<void> saveUserDetail(_i2.User? user) => (super.noSuchMethod(
        Invocation.method(
          #saveUserDetail,
          [user],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<bool> updateUserDetail(_i2.User? user) => (super.noSuchMethod(
        Invocation.method(
          #updateUserDetail,
          [user],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.User> getUserDetail(String? uid) => (super.noSuchMethod(
        Invocation.method(
          #getUserDetail,
          [uid],
        ),
        returnValue: _i4.Future<_i2.User>.value(_FakeUser_1(
          this,
          Invocation.method(
            #getUserDetail,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.User>);
}