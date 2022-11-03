import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_events.dart';
import '../controller/movies_state.dart';

class PopularScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetPopularMoviesEvent()), 
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(AppStrings.popularMovies),
            centerTitle: true,
            elevation: 0,
          ),
          body: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              switch(state.popularState){
                case RequestState.loading : 
                  return const Center(
                  child: CircularProgressIndicator(), 
                );
                case RequestState.loaded :
                  return FadeIn(duration: const Duration(milliseconds: 500),
                child: ListView.builder(
                  itemCount: state.popularMovies.length,
                  itemBuilder: (BuildContext context, index) {
                   return MovieCardComponent(movie: state.popularMovies[index]);
              },
             ),
          );
          case RequestState.error :
            return Center(child: Text(state.popularMessage),);
          }
          
        },
      ),
      ),
    );
  }
}

class MovieCardComponent extends StatelessWidget {
  const MovieCardComponent({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.s10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppSizes.s8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.s8),
              child: CachedNetworkImage(
                height: AppSizes.s270,
                width: MediaQuery.of(context).size.width * 0.3,
                imageUrl: ApiConstance.imageUrl(movie.backDropPath),
                fit: BoxFit.cover,
         
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.s15, vertical: AppSizes.s8),
            child: SizedBox( 
              height: AppSizes.s280,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: AppSizes.s30,
                        width: AppSizes.s60,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(AppSizes.s8),
                        ),
                        child: Center(
                          child: Text(
                            movie.releaseDate.substring(0,4),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSizes.s20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      const SizedBox(
                        width: AppSizes.s5,
                      ),
                      Text(
                        movie.voteAverage.toString(),
                      ),
                    ],
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
