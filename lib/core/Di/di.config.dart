// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../auth/data/data_source/auth_data_source_contract.dart' as _i47;
import '../../auth/data/data_source/auth_data_source_impl.dart' as _i359;
import '../../auth/data/repository_impl/auth_repository_impl.dart' as _i607;
import '../../auth/domin/repository_contract/auth_repository_contract.dart'
    as _i953;
import '../../auth/ui/login/login_view_model_cubit.dart' as _i99;
import '../../auth/ui/register/register_view_model.dart' as _i19;
import '../../home/home_tab/data/data_source/data-sources-impl/brand-online-data-source-impl.dart'
    as _i448;
import '../../home/home_tab/data/data_source/data-sources-impl/categorires-online-data-source.dart'
    as _i631;
import '../../home/home_tab/data/data_source/data_source_contract/brand-online-data-source-contract.dart'
    as _i618;
import '../../home/home_tab/data/data_source/data_source_contract/categories-data-source.dart'
    as _i672;
import '../../home/home_tab/data/repositroy/brand-repository-impl.dart'
    as _i872;
import '../../home/home_tab/data/repositroy/categories-repository-impl.dart'
    as _i369;
import '../../home/home_tab/domin/repository_contract/brand-repository-contract.dart'
    as _i769;
import '../../home/home_tab/domin/repository_contract/categoires-contract.dart'
    as _i478;
import '../../home/home_tab/domin/use_case/brand-use-case.dart' as _i283;
import '../../home/home_tab/domin/use_case/categories-use-case.dart' as _i982;
import '../../home/home_tab/ui/cubit/home_tab_view_model_cubit.dart' as _i765;
import '../api/api-manger.dart' as _i370;

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
    gh.singleton<_i370.ApiManger>(() => _i370.ApiManger());
    gh.factory<_i47.AuthDataSourceContract>(
        () => _i359.AuthDataSourceImpl(apiManger: gh<_i370.ApiManger>()));
    gh.factory<_i618.BrandOnlineDataSourceContract>(
        () => _i448.BrandOnlineDataSourceImpl(gh<_i370.ApiManger>()));
    gh.factory<_i672.CategoriesDataSource>(() =>
        _i631.CategoriesOnlineDataSource(apiManger: gh<_i370.ApiManger>()));
    gh.factory<_i769.BrandRepositoryContract>(() =>
        _i872.BrandRepositoryImpl(gh<_i618.BrandOnlineDataSourceContract>()));
    gh.factory<_i283.BrandUseCase>(() => _i283.BrandUseCase(
        brandRepositoryContract: gh<_i769.BrandRepositoryContract>()));
    gh.factory<_i478.CategoriesContract>(() => _i369.CategoriesRepositoryImpl(
        categoriesDataSource: gh<_i672.CategoriesDataSource>()));
    gh.factory<_i953.AuthRepositoryContract>(() => _i607.AuthRepositoryImpl(
        authDataSourceContract: gh<_i47.AuthDataSourceContract>()));
    gh.factory<_i19.RegisterViewModel>(
        () => _i19.RegisterViewModel(gh<_i953.AuthRepositoryContract>()));
    gh.factory<_i982.CategoriesUseCase>(() => _i982.CategoriesUseCase(
        categoriesContract: gh<_i478.CategoriesContract>()));
    gh.factory<_i99.LoginViewModelCubit>(() => _i99.LoginViewModelCubit(
        authRepositoryContract: gh<_i953.AuthRepositoryContract>()));
    gh.factory<_i765.HomeTabViewModelCubit>(
        () => _i765.HomeTabViewModelCubit(gh<_i982.CategoriesUseCase>()));
    return this;
  }
}
