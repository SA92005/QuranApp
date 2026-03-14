// import 'package:injectable/injectable.dart';
// import 'package:quran_app/core/helper/result_api.dart';
// import 'package:quran_app/home/domain/entity/quran_entity.dart';
// import 'package:quran_app/surah_text/domain/repository/data_source/surah_text_data_source.dart';
// import 'package:quran_app/surah_text/domain/repository/repo/surah_text_repo.dart';

// @Injectable(as: SurahTextRepo)
// class SurahTextRepoImpl implements SurahTextRepo {
//   SurahTextRepoImpl(this.surahTextDataSource);
//   SurahTextDataSource surahTextDataSource;
//   @override
//   Future<ResultApi<List<AyahsEntity>>> getSurahText(int surahNumber) async {
//     return await surahTextDataSource.getSurahText(surahNumber);
//   }
// }
