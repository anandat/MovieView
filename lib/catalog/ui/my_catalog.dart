import 'package:cached_network_image/cached_network_image.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';
import 'package:flutter_shopping_cart/catalog/models/movieListModel.dart';

class MovieUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MovieState();
}

class _MovieState extends State<MovieUi> {
  MovieModel movie = MovieModel();
  CatalogBloc catalogBloc = CatalogBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catalogBloc.add(GetMovieData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatalogBloc, CatalogState>(
      listener: (Context, state) {
        if (state is MovieDataResponse) {
          movie = state.movieModel;
        }
      },
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (Context, State) {
          // int size = movie.data.length;
          return Scaffold(
              appBar: appbar(),
              body: GridView.count(
                crossAxisCount: 3,
                //we can put orientation check as well for dynamic
                children: List.generate(10, (index) {
                  return Center(
                      child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                       // SearchBar(),
                        // Api is not good for search
                        // on search io add debouncing algo to better rewsult and cost optimization
                        getTile(movie, index)
                      ],
                    ),
                  ));
                }),
              ));
        },
      ),
      bloc: catalogBloc,
    );
  }
}

getTile(MovieModel movie, int index) {

  return Column(
    children: <Widget>[
      
      Container(
        height: 20,
        width: 50,
        child: CachedNetworkImage(
        //cacheManager: ,
          width: 40,
          progressIndicatorBuilder: (context, url, progress) =>
              CircularProgressIndicator(
                value: progress.progress,
              ),
          imageUrl:
          movie.data[index].poster != null ? movie.data[index].poster: "",
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      Text(movie.data[index].title != null ? movie.data[index].title : ""),
    ],
  );
}

appbar() {
  return AppBar(
    title: Text('Catalog'),
  );
}
