import 'package:injectable/injectable.dart';
import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/data/quran_dat/api/quran_api.dart';
import 'package:quran_app/home/data/model/quran_dto.dart';
import 'package:quran_app/home/data/quran_dat/local/quran_local.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';
import 'package:quran_app/home/domain/repository/data_source/quran_data_sorce.dart';

@Injectable(as: QuranDataSorce)
class QuranDataSourceImpl implements QuranDataSorce {
  QuranDataSourceImpl(this.quranApi, this.quranLocal);
  QuranApi quranApi;
  QuranLocal quranLocal;
  @override
  Future<ResultApi<QuranEntity>> getQuran() async {
    final catchedQuran = await quranLocal.getQuran();
    if (catchedQuran is SuccessAPI<QuranEntity>) {
      return catchedQuran;
    }
    final result = await quranApi.getAPI();
    switch (result) {
      case SuccessAPI<QuranDto>():
        final resultDTO = result.data;
        final resultEntity = resultDTO?.toEntity();
        if (resultEntity?.data.surahs == null) {
          return ErrorAPI<QuranEntity>('null');
        }
        await quranLocal.cacheQuran(resultEntity!);
        return SuccessAPI<QuranEntity>(resultEntity);
      case ErrorAPI<QuranDto>():
        return ErrorAPI<QuranEntity>(result.errorMessage);
    }
  }
}
