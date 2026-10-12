import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility/Data/DataSource/product_remote_data_source.dart';
import 'package:mobility/Data/Repositories/product_repository_impl.dart';
import 'package:mobility/Domain/UseCase/get_product_usecase.dart';
import 'package:mobility/Presentation/features/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(
      getProductUsecase: GetProductUseCase(
        ProductRepositoryImpl(ProductRemoteDataSourceImpl(Dio())),
      ),
    );
    homeBloc.add(HomeMainEvent());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Products'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return switch (state) {
              HomeInitial() ||
              HomeLoading() => const Center(child: CircularProgressIndicator()),
              HomeFailure(:final message) => Center(child: Text(message)),
              HomeLoaded(:final products) => RefreshIndicator(
                onRefresh: () async => homeBloc.add(HomeMainEvent()),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
