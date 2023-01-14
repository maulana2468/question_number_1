import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:suitmedia_question_1/enum.dart';
import 'package:suitmedia_question_1/models/model_list.dart';
import 'package:suitmedia_question_1/services/api_services.dart';

part 'third_screen_event.dart';
part 'third_screen_state.dart';

class ThirdScreenBloc extends Bloc<ThirdScreenEvent, ThirdScreenState> {
  ThirdScreenBloc()
      : super(ThirdScreenInitial(0, DataAvailable.init, const [])) {
    on<InitLoadData>((event, emit) async {
      emit(
        ThirdScreenInitial(
          state.pages,
          (state.pages == 0)
              ? DataAvailable.initLoading
              : DataAvailable.loading,
          state.listData,
        ),
      );

      ResultData? resultData = await getDataReqres(state.pages + 1);

      if (kDebugMode) {
        print(resultData?.status);
        print(resultData?.data);
      }

      var oldData = state.listData.toList();
      oldData.addAll(resultData!.data);

      if (resultData.status == DataStatus.available) {
        emit(
          ThirdScreenInitial(
            state.pages + 1,
            DataAvailable.available,
            oldData,
          ),
        );
      } else if (resultData.status == DataStatus.notfound) {
        emit(
          ThirdScreenInitial(
            state.pages,
            DataAvailable.unavailable,
            oldData,
          ),
        );
      } else {
        emit(
          ThirdScreenInitial(
            state.pages,
            DataAvailable.unavailable,
            oldData,
          ),
        );
      }
    });
  }
}
