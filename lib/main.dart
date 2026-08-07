import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/confirmation/presentation/bloc/confirmation_bloc.dart';
import 'package:flutter_task/features/confirmation/presentation/bloc/confirmation_event.dart';

import 'app/my_app.dart';
import 'core/di/injection_container.dart';
import 'features/event_detail/presentation/bloc/event_detail_bloc.dart';
import 'features/explore/presentation/bloc/explore_bloc.dart';
import 'features/main/presentation/bloc/navigation_bloc.dart';
import 'features/saved/presentation/bloc/saved_event_bloc.dart';
import 'features/saved/presentation/bloc/saved_event_event.dart';
import 'features/tickets/presentation/bloc/tickets_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(create: (_) => sl<NavigationBloc>()),

        BlocProvider<ExploreBloc>(
          create: (_) => sl<ExploreBloc>()..add(LoadExplore()),
        ),

        BlocProvider<TicketsBloc>(
          create: (_) => sl<TicketsBloc>()..add(OnLoadTickets()),
        ),

        BlocProvider<EventDetailBloc>(create: (_) => sl<EventDetailBloc>()),

        BlocProvider<SavedEventsBloc>(
          create: (_) => sl<SavedEventsBloc>()..add(LoadSavedEvents()),
        ),
        BlocProvider<ConfirmationBloc>(
          create: (_) => sl<ConfirmationBloc>()..add(LoadBookingDetails()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
