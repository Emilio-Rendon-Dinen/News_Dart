abstract class CoreUseCase<Type, Params> {
  Future<Type> call({Params params});
}
