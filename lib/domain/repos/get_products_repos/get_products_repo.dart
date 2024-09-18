import 'package:either_dart/either.dart';
import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';

abstract class GetProductsRepo {
  Future<Either<String, List<ProductsResponseDM>>> getProducts();
}