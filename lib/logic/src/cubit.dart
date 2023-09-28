import 'package:catering_core/core.dart';

part 'state.dart';

class BaseLogic<T> extends Cubit<BaseLogicState> {
  BaseLogic() : super(const BaseLogicInit(trigger: 0));
  Future<BaseLogicState> fetch<M>(
      Future<Either<Failure, BaseResponse<T>>> Function(M data) repo,
      M data) async {
    try {
      emit(BaseLogicLoading(trigger: state.trigger + 1));
      final res = await repo(data);
      res.fold(
          (l) => emit(BaseLogicError(failure: l, trigger: state.trigger + 1)),
          (r) => emit(BaseLogicSuccess<BaseResponse<T>>(
              data: r, trigger: state.trigger + 1)));
      return state;
    } catch (e) {
      emit(BaseLogicError(
          failure: Failure(
              response: BaseResponse(status: 1001, message: e.toString())),
          trigger: state.trigger + 1));
      return state;
    }
  }

  void success(BaseResponse<T> data) =>
      emit(BaseLogicSuccess(data: data, trigger: state.trigger + 1));

  void reset() => emit(BaseLogicInit(trigger: state.trigger + 1));
}
