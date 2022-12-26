import 'package:bloc/bloc.dart';
import 'package:task/data/task_repository.dart';
import 'package:task/model/category_model_entity.dart';
import 'package:task/model/product_model_entity.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TaskRepository taskRepository;

  HomeBloc({required this.taskRepository}) : super(HomeInitial()) {
    on<FetchProductsEvent>((event, emit) async {
      List<ProductModelEntity> products = await taskRepository.getProducts();
      emit(ProductsReadyState(products: products));
    });

    on<FetchCategoriesEvent>((event, emit) async {
      List<CategoryModelEntity> categories =
          await taskRepository.getCategories();
      emit(CategoriesReadyState(categories: categories));
    });
  }
}
