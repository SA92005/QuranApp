import 'package:quran_app/home/domain/entity/quran_entity.dart';

class QuranStates {}

class QuranInitState extends QuranStates {}

class QuranLoadingState extends QuranStates {}

class QuranSuccsessState extends QuranStates {
  QuranSuccsessState(this.dataEntity);
  final DataEntity dataEntity;
}

class QuranErrorState extends QuranStates {
  QuranErrorState(this.error);
  String error;
}

class QuranCachedState extends QuranStates {
  QuranCachedState(this.data);
  final DataEntity data;
}
