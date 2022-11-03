import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/enums.dart';
import '../controller/bloc/tv_bloc.dart';
import '../controller/bloc/tv_state.dart';

class TvTopRatedComponent extends StatelessWidget {
  const TvTopRatedComponent({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        switch (state.topRatedTvState) {
          case RequestState.loading : 
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case RequestState.loaded :
          return FadeIn(
          child: SizedBox(
            height: 170,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.topRatedTvs.length,
              itemBuilder: (context , index){
                final tv = state.topRatedTvs[index];
                return Container(
                  padding: const EdgeInsets.only(right: AppSizes.s8),
                  child: InkWell(
                     onTap: (){
                       //TODO : Navigate to topRated Tvs Screen
                     },
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(AppSizes.s15),
                       child: tv.backdropPath != null ? CachedNetworkImage(
                         width: 120,
                         fit: BoxFit.cover,
                         imageUrl: ApiConstance.imageUrl(tv.backdropPath!),
                         placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      
                         ) :const SizedBox(
                           height: 170,
                           width: 120,
                           child:   Icon(Icons.nearby_error_rounded),) ,
                        
                     ),
                  ),
                );
              },
              ),
          ),
          );
          case RequestState.error : 
            return SizedBox(
              height: 170,
              child: Center(
                child: Text(state.topRatedTvMessage),
              ),
            );
          }
      },
    );
  }

}