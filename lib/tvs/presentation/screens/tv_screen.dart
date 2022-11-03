import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_strings.dart';
import '../components/on_the_air_component.dart';
import '../components/tv_popular_component.dart';
import '../components/tv_top_rated_component.dart';
import '../controller/bloc/tv_bloc.dart';
import '../controller/bloc/tv_event.dart';

class TvScreen extends StatelessWidget {
 const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvBloc>()..add(GetOnTheAirTvEvent())..add(GetPopularTvEvent())..add(GetTopRatedTvEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('tvScrollView'),
          child: Column(
            children: [
               
               const OnTheAirComponent(),
               
               SizedBox(
                 width: double.infinity,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: AppSizes.s8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        Text(AppStrings.popular,
                       style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                          ),
                       Row(
                         children: const [
                           Text(AppStrings.seeMore),
                           Icon(Icons.arrow_forward_ios_outlined,size: AppSizes.s15,),
                         ],
                       )
                     ],
                   ),
                 ),
               ),
              
               const TvPopularComponent(),
              
               SizedBox(
                 width: double.infinity,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: AppSizes.s8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                        Text(AppStrings.topRated,
                       style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                          ),
                       Row(
                         children: const [
                           Text(AppStrings.seeMore),
                           Icon(Icons.arrow_forward_ios_outlined,size: AppSizes.s15,),
                         ],
                       )
                     ],
                   ),
                 ),
               ), 

              const TvTopRatedComponent(),
            ]
            ,
          ),
        ),
      ),
    );
  }
}
