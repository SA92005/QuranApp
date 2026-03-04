import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:quran_app/core/api/api_constant.dart';
import 'package:quran_app/core/helper/result_api.dart';
import 'package:quran_app/home/data/model/quran_dto.dart';

@injectable
@lazySingleton
class QuranApi {
  final dio = Dio();
  String path = ApiConstant.quranPath;
  Future<ResultApi<QuranDto>> getAPI() async {
    try {
      Response response = await dio.get(path);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final data = response.data as Map<String, dynamic>;
        final quran = QuranDto.fromJson(data);

        return SuccessAPI<QuranDto>(quran);
      } else {
        return ErrorAPI<QuranDto>(response.statusMessage!);
      }
    } catch (e) {
      return ErrorAPI<QuranDto>(e.toString());
    }
  }
}
