import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';

@injectable
@lazySingleton
class QuranLocal {
  final Box<QuranEntity> box = Hive.box<QuranEntity>('quran_box');
  Future<ResultApi<QuranEntity>> getQuran() async {
    try {
      final cachedQuran = box.get('quran');

      if (cachedQuran != null) {
        return SuccessAPI(cachedQuran);
      } else {
        return ErrorAPI("No cached Quran found");
      }
    } catch (e) {
      return ErrorAPI("Hive error: $e");
    }
  }

  Future<void> cacheQuran(QuranEntity quran) async {
    await box.put('quran', quran);
  }

  Future<void> clearCache() async {
    await box.clear();
  }
}
