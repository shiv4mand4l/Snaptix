import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/event_detail/data/repositories/event_repository_impl.dart';
import 'package:flutter_task/features/event_detail/domain/repositories/event_repository.dart';
import 'package:flutter_task/features/event_detail/domain/usecases/get_event_detail_usecase.dart';
import 'package:flutter_task/features/explore/data/datasource/local/explore_remote_data_source.dart';
import 'package:flutter_task/features/explore/data/repository/explore_repository_impl.dart';
import 'package:flutter_task/features/explore/domain/repository/explore_repositories.dart';
import 'package:flutter_task/features/explore/domain/usecases/get_explore_data_usecase.dart';
import 'package:flutter_task/features/explore/domain/usecases/search_events_usecase.dart';
import 'package:flutter_task/features/explore/domain/usecases/toggle_favourite_usecase.dart';
import 'package:flutter_task/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:flutter_task/features/saved/data/datasources/local/saved_event_local_data_source.dart';
import 'package:flutter_task/features/saved/data/repositories/saved_event_repository_impl.dart';
import 'package:flutter_task/features/saved/domain/repositories/saved_event_repository.dart';
import 'package:flutter_task/features/saved/domain/usecases/get_saved_events_usecase.dart';
import 'package:flutter_task/features/saved/domain/usecases/toggle_saved_event_usecase.dart';
import 'package:flutter_task/features/saved/presentation/bloc/saved_event_bloc.dart';
import 'package:flutter_task/features/saved/presentation/bloc/saved_event_event.dart';
import 'package:flutter_task/features/tickets/data/datasource/loacal/ticket_local_data_source.dart';
import 'package:flutter_task/features/tickets/data/repository/ticket_repository_impl.dart';
import 'package:flutter_task/features/tickets/domain/repository/ticket_repository.dart';
import 'package:flutter_task/features/tickets/domain/usecases/get_tickets_usecase.dart';
import 'package:flutter_task/features/tickets/presentation/bloc/tickets_bloc.dart';

import 'app/my_app.dart';
import 'features/event_detail/presentation/bloc/event_detail_bloc.dart';
import 'features/main/presentation/bloc/navigation_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // 1. Repository Providers
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ExploreRepository>(
          create: (context) => ExploreRepositoryImpl(
            remoteDataSource: ExploreRemoteDataSourceImpl(),
          ),
        ),
        RepositoryProvider<TicketRepository>(
          create: (context) =>
              TicketRepositoryImpl(TicketLocalDataSourceImpl()),
        ),

        RepositoryProvider<EventRepository>(
          create: (context) => EventRepositoryImpl(),
        ),
        RepositoryProvider<SavedEventRepository>(
          create: (context) =>
              SavedEventRepositoryImpl(SavedEventLocalDataSourceImpl()),
        ),
      ],

      // 2. BLoC Providers
      child: MultiBlocProvider(
        providers: [
          //  Explore BLoC with Use Cases Injected
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider(
            create: (context) {
              final repo = context.read<ExploreRepository>();
              return ExploreBloc(
                getExploreDataUseCase: GetExploreDataUseCase(repo),
                searchEventsUseCase: SearchEventsUseCase(repo),
                toggleFavouriteUseCase: ToggleFavouriteUseCase(repo),
              )..add(LoadExplore());
            },
          ),
          BlocProvider(
            create: (context) {
              final repo = context.read<TicketRepository>();
              return TicketsBloc(getTicketsUsecase: GetTicketsUsecase(repo))
                ..add(OnLoadTickets());
            },
          ),
          BlocProvider(
            create: (context) {
              final repo = context.read<EventRepository>();
              return EventDetailBloc(
                getEventDetailUseCase: GetEventDetailUseCase(repo),
              );
            },
          ),
          BlocProvider(
            create: (context) {
              final repo = context.read<SavedEventRepository>();
              return SavedEventsBloc(
                getSavedEventsUsecase: GetSavedEventsUsecase(repo),
                toggleSavedEventUsecase: ToggleSavedEventUsecase(repo),
              )..add(LoadSavedEvents());
            },
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
