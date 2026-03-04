// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:quran_app/home/data/quran_dat/api/quran_api.dart' as _i1022;
import 'package:quran_app/home/data/quran_dat/local/quran_local.dart' as _i537;
import 'package:quran_app/home/data/repository/data_source/quran_data_source_impl.dart'
    as _i653;
import 'package:quran_app/home/data/repository/repo/quran_repo_impl.dart'
    as _i254;
import 'package:quran_app/home/domain/repository/data_source/quran_data_sorce.dart'
    as _i860;
import 'package:quran_app/home/domain/repository/repo/quran_repo.dart' as _i252;
import 'package:quran_app/home/domain/usecase/quran_usecase.dart' as _i548;
import 'package:quran_app/home/presentation/view_model/quran_cubit.dart'
    as _i409;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1022.QuranApi>(() => _i1022.QuranApi());
    gh.factory<_i537.QuranLocal>(() => _i537.QuranLocal());
    gh.factory<_i860.QuranDataSorce>(() => _i653.QuranDataSourceImpl(
          gh<_i1022.QuranApi>(),
          gh<_i537.QuranLocal>(),
        ));
    gh.factory<_i252.QuranRepo>(
        () => _i254.QuranRepoImpl(gh<_i860.QuranDataSorce>()));
    gh.factory<_i548.QuranUsecase>(
        () => _i548.QuranUsecase(gh<_i252.QuranRepo>()));
    gh.factory<_i409.QuranCubit>(
        () => _i409.QuranCubit(gh<_i548.QuranUsecase>()));
    return this;
  }
}
