// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repos/get_products_repos/get_products_repo_ds_impl.dart'
    as _i890;
import '../../data/repos/get_products_repos/get_products_repo_impl.dart'
    as _i505;
import '../../ui/screens/products/products_view_model.dart' as _i1070;
import '../repos/get_products_repos/get_products_repo.dart' as _i96;
import '../repos/get_products_repos/get_products_repo_ds.dart' as _i600;
import '../use_cases/get_products_use_case/get_products_use_case.dart' as _i33;

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
    gh.factory<_i600.GetProductsRepoDs>(() => _i890.GetProductsRepoDsImpl());
    gh.factory<_i96.GetProductsRepo>(
        () => _i505.GetProductsRepoImpl(gh<_i600.GetProductsRepoDs>()));
    gh.factory<_i33.GetProductsUseCase>(
        () => _i33.GetProductsUseCase(gh<_i96.GetProductsRepo>()));
    gh.factory<_i1070.ProductsViewModel>(
        () => _i1070.ProductsViewModel(gh<_i33.GetProductsUseCase>()));
    return this;
  }
}
