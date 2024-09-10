part of 'product_bloc.dart';

sealed class ProductState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState
{

}

class ProductLoaded extends ProductState
{
  List<Products>?plist;
  ProductLoaded({required this.plist});

  @override
  // TODO: implement props
  List<Object?> get props => [plist];

}

class ProductErrorState extends ProductState
{
  String? errorMessage;
  ProductErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}