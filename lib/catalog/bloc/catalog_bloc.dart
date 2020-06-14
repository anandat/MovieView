import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/catalog/models/movieListModel.dart';
import 'package:flutter_shopping_cart/catalog/repo/MovieRepo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  @override
  CatalogState get initialState => CatalogLoading();
  MovieRepo movieRepo = MovieRepo();
  MovieModel movieModel = MovieModel();

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is GetMovieData) {
      movieModel = await movieRepo.moviedata();
      if (movieModel != null) {
        yield MovieDataResponse(movieModel);
      }
      else{
        print("Welcome error this side");
      }
    }
  }
}
