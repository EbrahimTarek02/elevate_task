import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';
import 'package:elevate_task/domain/repos/get_products_repos/get_products_repo_ds.dart';
import 'package:elevate_task/ui/utils/constants.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductsRepoDs)
class GetProductsRepoDsImpl extends GetProductsRepoDs {

  List<ProductsResponseDM> parseProducts(List<dynamic> jsonResponse) {
    return jsonResponse.map((product) => ProductsResponseDM.fromJson(product)).toList();
  }

  @override
  Future<Either<String, List<ProductsResponseDM>>> getProducts() async{
    String baseUrl = "fakestoreapi.com";
    String endPoint = "products";

    try {
      Uri uri = Uri.https(baseUrl, endPoint);

      Response response = await get(uri);

      List<ProductsResponseDM> getProductsResponse = parseProducts(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getProductsResponse);
      }
      else {
        return const Left(Constants.defaultErrorMessage);
      }
    } catch(_) {
      return const Left(Constants.defaultErrorMessage);
    }
  }

}