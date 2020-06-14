import 'package:auto_size_text/auto_size_text.dart';
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
     //catalogBloc = BlocProvider.of<CatalogBloc>(context);

    return BlocListener(

      listener: (Context, state) {
        if (state is MovieDataResponse) {
          movie = state.movieModel;
        }
      },
      bloc: catalogBloc,
      child: BlocBuilder(
        bloc: catalogBloc,
        builder: (Context, State) {
          // int size = movie.data.length;
          return gridView(movie);
        },
      ),

    );
  }
}

Widget gridView(MovieModel movie){
 return Scaffold(
    //  resizeToAvoidBottomPadding: false,
      appBar: appbar(),
      body: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        //we can put orientation check as well for dynamic
        children: List.generate(10, (index) {
          return Container(
            height: 100,
            width: 20,

            //padding: EdgeInsets.all(16),
            child: Flexible(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    // SearchBar(),
                    // Api is not good for search
                    // on search io add debouncing algo to better rewsult and cost optimization

                    getTile(movie, index),
                    AutoSizeText(movie.data[index].title != null
                        ? movie.data[index].title
                        : ""),
                    AutoSizeText(movie.data[index].year != null
                        ? movie.data[index].year
                        : ""),
                  ],
                )),
          );
        }),
      ));
}

getTile(MovieModel movie, int index) {
  (index != null && index.toString().isEmpty) ? index : "";
  return Container(
    height: 20,
    width: 70,
    child: CachedNetworkImage(
      //cacheManager: ,
      //width: 40,
      progressIndicatorBuilder: (context, url, progress) =>
          CircularProgressIndicator(
        value: progress.progress,
      ),
      imageUrl:
          (movie.data[index].poster != null &&  movie.data[index].poster.isNotEmpty)? movie.data[index].poster : "",
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

appbar() {
  return AppBar(
    title: Text('Catalog'),
  );
}
