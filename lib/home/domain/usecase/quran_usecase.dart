import 'package:injectable/injectable.dart';
import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/domain/entity/quran_entity.dart';
import 'package:quran_app/home/domain/repository/repo/quran_repo.dart';

@injectable
class QuranUsecase {
  QuranUsecase(this.repo);
  QuranRepo repo;
  Future<ResultApi<QuranEntity>> getQuran() => repo.getQuran();
}
