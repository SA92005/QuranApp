import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';

abstract class QuranRepo {
  Future<ResultApi<QuranEntity>> getQuran();
}
