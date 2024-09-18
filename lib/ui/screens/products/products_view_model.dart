import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';
import 'package:elevate_task/domain/use_cases/get_products_use_case/get_products_use_case.dart';
import 'package:elevate_task/ui/screens/products/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  GetProductsUseCase getProductsUseCase;

  ProductsViewModel(this.getProductsUseCase) : super(ProductsInitialState());

  Future<void> getProducts() async{
    emit(ProductsLoadingState());

    Either<String, List<ProductsResponseDM>> response = await getProductsUseCase.execute();

    response.fold((errorMessage) {
      emit(ProductsErrorState(errorMessage));
    }, (success) {
      emit(ProductsSuccessState(success));
    });
  }

  int calculateProductPriceBeforeDiscount(num? originalPrice, num? discountPercentage) {
    if (originalPrice == null) return 0;

    if (discountPercentage == null) return originalPrice.ceil();

    return (originalPrice + (originalPrice * (discountPercentage / 100))).ceil();
  }
}