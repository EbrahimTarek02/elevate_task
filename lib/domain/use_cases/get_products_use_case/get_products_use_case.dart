import 'package:either_dart/either.dart';
import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';
import 'package:elevate_task/domain/repos/get_products_repos/get_products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  GetProductsRepo getProductsRepo;

  GetProductsUseCase(this.getProductsRepo);

  Future<Either<String, List<ProductsResponseDM>>> execute() {
    return getProductsRepo.getProducts();
  }
}