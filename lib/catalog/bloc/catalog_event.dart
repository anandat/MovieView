part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class LoadCatalog extends CatalogEvent {
  @override
  List<Object> get props => [];
}
class GetMovieData extends CatalogEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
