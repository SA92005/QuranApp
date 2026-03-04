import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';
import 'package:quran_app/home/domain/usecase/quran_usecase.dart';
import 'package:quran_app/home/presentation/view_model/quran_states.dart';

@injectable
class QuranCubit extends Cubit<QuranStates> {
  QuranCubit(this.quranUsecase) : super(QuranInitState());
  QuranUsecase quranUsecase;

  Future<void> fetchQuran() async {
    emit(QuranLoadingState());
    final result = await quranUsecase.getQuran();

    if (result is SuccessAPI<QuranEntity>) {
      emit(QuranSuccsessState(result.data!.data));
      return;
    }

    switch (result) {
      case SuccessAPI<QuranEntity>():
        emit(QuranSuccsessState(result.data!.data));

      case ErrorAPI<QuranEntity>():
        emit(QuranErrorState(result.errorMessage));
    }
  }
}
