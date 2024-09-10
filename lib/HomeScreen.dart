import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterequitableexample/products/product_bloc.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {

          if(state is ProductLoading)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          else if(state is ProductLoaded)
          {
            return ListView.builder(
                itemCount: state.plist!.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('${state.plist![index].thumbnail}'),
                    ),
                    title: Text('${state.plist![index].title}'),
                    subtitle: Text('${state.plist![index].price}'),
                  );
                }
            );
          }
          else if(state is ProductErrorState)
            {
              return Center(child: Text('${state.errorMessage}'),);
            }
          else
            {
              return Container();
            }
        },),
    );
  }
}
