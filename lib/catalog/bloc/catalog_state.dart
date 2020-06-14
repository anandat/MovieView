part of 'catalog_bloc.dart';

@immutable
abstract class CatalogState extends Equatable {
  List<Object> get props => [];
}

class CatalogLoading extends CatalogState{}
class MovieDataResponse extends CatalogState {

  final MovieModel movieModel;
  MovieDataResponse(this.movieModel);


}
