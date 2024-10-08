import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/top_rated_component.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context){
       return  sl< MoviesBloc>()..add(GetNowPlayingMoviesEvent())..add(GetPopularEvent())..add(GetTopRatedMoviesEvent());
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),

              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15, color: Colors.white

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See More',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white

                              ),
                            ),

                            const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white

                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See More', style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.white

                            )),
                            const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white

                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
