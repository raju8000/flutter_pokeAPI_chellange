import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
class Result<T,E> with _$Result<T,E>{
  //late T data;
  const factory Result.success(T data) = _Success;
  const factory Result.failure(E error) = _Failure;
}
