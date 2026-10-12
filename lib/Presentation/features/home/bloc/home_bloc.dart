import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility/Domain/Entity/product.dart';
import 'package:mobility/Domain/UseCase/get_product_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductUseCase getProductUsecase;

  HomeBloc({required this.getProductUsecase}) : super(HomeInitial()) {
    on<HomeMainEvent>(_loaded);
  }

  Future<void> _loaded(HomeMainEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      final products = await getProductUsecase.execute();
      emit(HomeLoaded(products: products));
    } catch (e) {
      emit(HomeFailure(message: e.toString()));
    }
  }
}
