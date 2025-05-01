// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/api-manger.dart' as _i745;
import '../../data/data-source-contract/brand-online-data-source-contract.dart'
    as _i749;
import '../../data/data-source-contract/categories-data-source.dart' as _i278;
import '../../data/data-source-contract/Login_data_source_contract.dart'
    as _i957;
import '../../data/data-source-contract/register_data_source_contract.dart'
    as _i225;
import '../../data/data-sources-impl/brand-online-data-source-impl.dart'
    as _i639;
import '../../data/data-sources-impl/categorires-online-data-source.dart'
    as _i1055;
import '../../data/data-sources-impl/login_data_source_impl.dart' as _i379;
import '../../data/data-sources-impl/register_data_source_impl.dart' as _i524;
import '../../data/repositories/brand-repository-impl.dart' as _i703;
import '../../data/repositories/categories-repository-impl.dart' as _i99;
import '../../data/repositories/login_repo_impl.dart' as _i119;
import '../../data/repositories/register_repo_impl.dart' as _i511;
import '../../domin/repositories_contract/brand-repository-contract.dart'
    as _i326;
import '../../domin/repositories_contract/categoires-contract.dart' as _i1017;
import '../../domin/repositories_contract/login_repo_contract.dart' as _i926;
import '../../domin/repositories_contract/register_repo_contrcat.dart' as _i941;
import '../../domin/use-cases/brand-use-case.dart' as _i353;
import '../../domin/use-cases/categories-use-case.dart' as _i783;
import '../../ui/Auth/login/login_view_model_cubit.dart' as _i64;
import '../../ui/Auth/register/register_view_model.dart' as _i573;

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
    gh.singleton<_i745.ApiManger>(() => _i745.ApiManger());
    gh.factory<_i278.CategoriesDataSource>(() =>
        _i1055.CategoriesOnlineDataSource(apiManger: gh<_i745.ApiManger>()));
    gh.factory<_i225.RegisterDataSourceContract>(
        () => _i524.RegisterDataSourceImpl(apiManger: gh<_i745.ApiManger>()));
    gh.factory<_i957.LoginDataSourceContract>(
        () => _i379.LoginDataSourceImpl(apiManger: gh<_i745.ApiManger>()));
    gh.factory<_i941.RegisterRepoContract>(() => _i511.RegisterRepoImpl(
        registerDataSourceContract: gh<_i225.RegisterDataSourceContract>()));
    gh.factory<_i1017.CategoriesContract>(() => _i99.CategoriesRepositoryImpl(
        categoriesDataSource: gh<_i278.CategoriesDataSource>()));
    gh.factory<_i749.BrandOnlineDataSourceContract>(
        () => _i639.BrandOnlineDataSourceImpl(gh<_i745.ApiManger>()));
    gh.factory<_i783.CategoriesUseCase>(() => _i783.CategoriesUseCase(
        categoriesContract: gh<_i1017.CategoriesContract>()));
    gh.factory<_i926.LoginRepsContract>(() => _i119.LoginRepoImpl(
        loginDataSourceContract: gh<_i957.LoginDataSourceContract>()));
    gh.factory<_i573.RegisterViewModel>(
        () => _i573.RegisterViewModel(gh<_i941.RegisterRepoContract>()));
    gh.factory<_i326.BrandRepositoryContract>(() =>
        _i703.BrandRepositoryImpl(gh<_i749.BrandOnlineDataSourceContract>()));
    gh.factory<_i353.BrandUseCase>(() => _i353.BrandUseCase(
        brandRepositoryContract: gh<_i326.BrandRepositoryContract>()));
    gh.factory<_i64.LoginViewModelCubit>(() => _i64.LoginViewModelCubit(
        loginRepoContract: gh<_i926.LoginRepsContract>()));
    return this;
  }
}
