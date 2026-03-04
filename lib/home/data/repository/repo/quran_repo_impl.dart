import 'package:injectable/injectable.dart';
import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';
import 'package:quran_app/home/domain/repository/data_source/quran_data_sorce.dart';
import 'package:quran_app/home/domain/repository/repo/quran_repo.dart';

@Injectable(as: QuranRepo)
class QuranRepoImpl implements QuranRepo {
  QuranRepoImpl(this.quranDataSorce);
  QuranDataSorce quranDataSorce;
  @override
  Future<ResultApi<QuranEntity>> getQuran() async {
    return await quranDataSorce.getQuran();
  }
}
