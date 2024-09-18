import 'package:either_dart/either.dart';
import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';
import 'package:elevate_task/domain/repos/get_products_repos/get_products_repo.dart';
import 'package:elevate_task/domain/repos/get_products_repos/get_products_repo_ds.dart';
import 'package:elevate_task/ui/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@Injectable(as: GetProductsRepo)
class GetProductsRepoImpl extends GetProductsRepo {
  GetProductsRepoDs getProductsRepoDs;

  GetProductsRepoImpl(this.getProductsRepoDs);

  @override
  Future<Either<String, List<ProductsResponseDM>>> getProducts() async{
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      return getProductsRepoDs.getProducts();
    }
    else{
      return const Left(Constants.networkErrorMessage);
    }
  }

}