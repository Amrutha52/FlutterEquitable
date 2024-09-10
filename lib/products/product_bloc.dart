import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterequitableexample/model/Products.dart';

import '../service/apiservice.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState>
{
  ProductBloc() : super(ProductLoading()) {
    on<ProductLoadedEvent>((event, emit) async {
      emit(ProductLoading());
      try
      {
        ApiService apiService = ApiService();
        var s = await apiService.fetchData();
        emit(ProductLoaded(plist: s));
      }
      catch(e)
      {
       // emit();
      }
      // TODO: implement event handler
    });
  }
}
