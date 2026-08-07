import 'package:get_it/get_it.dart';

// =====================================================
// EVENT DETAIL
// =====================================================

import 'package:flutter_task/features/event_detail/data/datasources/local/event_local_data_source.dart';
import 'package:flutter_task/features/event_detail/data/repositories/event_repository_impl.dart';
import 'package:flutter_task/features/event_detail/domain/repositories/event_repository.dart';
import 'package:flutter_task/features/event_detail/domain/usecases/get_event_detail_usecase.dart';
import 'package:flutter_task/features/event_detail/presentation/bloc/event_detail_bloc.dart';

// =====================================================
// EXPLORE - DATA
// =====================================================

import 'package:flutter_task/features/explore/data/datasource/local/explore_local_data_source.dart';
import 'package:flutter_task/features/explore/data/repository/explore_repository_impl.dart';

// =====================================================
// EXPLORE - DOMAIN
// =====================================================

import 'package:flutter_task/features/explore/domain/repository/explore_repositories.dart';
import 'package:flutter_task/features/explore/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_task/features/explore/domain/usecases/get_featured_banner_usecase.dart';
import 'package:flutter_task/features/explore/domain/usecases/get_nearby_events_usecase.dart';
import 'package:flutter_task/features/explore/domain/usecases/get_trending_events_usecase.dart';

// =====================================================
// EXPLORE - PRESENTATION
// =====================================================

import 'package:flutter_task/features/explore/presentation/bloc/explore_bloc.dart';

// =====================================================
// TICKETS
// =====================================================

import 'package:flutter_task/features/tickets/data/datasource/loacal/ticket_local_data_source.dart';
import 'package:flutter_task/features/tickets/data/repository/ticket_repository_impl.dart';
import 'package:flutter_task/features/tickets/domain/repository/ticket_repository.dart';
import 'package:flutter_task/features/tickets/domain/usecases/get_tickets_usecase.dart';
import 'package:flutter_task/features/tickets/presentation/bloc/tickets_bloc.dart';

// =====================================================
// SAVED EVENTS
// =====================================================

import 'package:flutter_task/features/saved/data/datasources/local/saved_event_local_data_source.dart';
import 'package:flutter_task/features/saved/data/repositories/saved_event_repository_impl.dart';
import 'package:flutter_task/features/saved/domain/repositories/saved_event_repository.dart';
import 'package:flutter_task/features/saved/domain/usecases/get_saved_events_usecase.dart';
import 'package:flutter_task/features/saved/domain/usecases/toggle_saved_event_usecase.dart';
import 'package:flutter_task/features/saved/presentation/bloc/saved_event_bloc.dart';

// =====================================================
// NAVIGATION
// =====================================================

import 'package:flutter_task/features/main/presentation/bloc/navigation_bloc.dart';

// =====================================================
// CONFIRMATION
// =====================================================

import 'package:flutter_task/features/confirmation/presentation/bloc/confirmation_bloc.dart';

// =====================================================
// GET IT INSTANCE
// =====================================================

final sl = GetIt.instance;

// =====================================================
// INITIALIZE DEPENDENCIES
// =====================================================

Future<void> initDependencies() async {
  // ===================================================
  // EVENT DETAIL
  // ===================================================

  // Data Source
  sl.registerLazySingleton<EventLocalDataSource>(
    () => EventLocalDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(sl<EventLocalDataSource>()),
  );

  // Use Case
  sl.registerLazySingleton<GetEventDetailUseCase>(
    () => GetEventDetailUseCase(sl<EventRepository>()),
  );

  // Bloc
  sl.registerFactory<EventDetailBloc>(
    () => EventDetailBloc(sl<GetEventDetailUseCase>()),
  );

  // ===================================================
  // EXPLORE
  // ===================================================

  // -------------------------
  // Data Source
  // -------------------------

  sl.registerLazySingleton<ExploreLocalDataSource>(
    () => ExploreLocalDataSourceImpl(),
  );

  // -------------------------
  // Repository
  // -------------------------

  sl.registerLazySingleton<ExploreRepository>(
    () => ExploreRepositoryImpl(localDataSource: sl<ExploreLocalDataSource>()),
  );

  // -------------------------
  // Use Cases
  // -------------------------

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl<ExploreRepository>()),
  );

  sl.registerLazySingleton<GetTrendingEventsUseCase>(
    () => GetTrendingEventsUseCase(sl<ExploreRepository>()),
  );

  sl.registerLazySingleton<GetNearbyEventsUseCase>(
    () => GetNearbyEventsUseCase(sl<ExploreRepository>()),
  );

  sl.registerLazySingleton<GetFeaturedBannerUseCase>(
    () => GetFeaturedBannerUseCase(sl<ExploreRepository>()),
  );

  // -------------------------
  // Explore Bloc
  // -------------------------

  sl.registerFactory<ExploreBloc>(
    () => ExploreBloc(
      getCategoriesUseCase: sl<GetCategoriesUseCase>(),
      getTrendingEventsUseCase: sl<GetTrendingEventsUseCase>(),
      getNearbyEventsUseCase: sl<GetNearbyEventsUseCase>(),
      getFeaturedBannerUseCase: sl<GetFeaturedBannerUseCase>(),
    ),
  );

  // ===================================================
  // TICKETS
  // ===================================================

  // Data Source
  sl.registerLazySingleton<TicketLocalDataSource>(
    () => TicketLocalDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<TicketRepository>(
    () => TicketRepositoryImpl(sl<TicketLocalDataSource>()),
  );

  // Use Case
  sl.registerLazySingleton<GetTicketsUsecase>(
    () => GetTicketsUsecase(sl<TicketRepository>()),
  );

  // Bloc
  sl.registerFactory<TicketsBloc>(
    () => TicketsBloc(getTicketsUsecase: sl<GetTicketsUsecase>()),
  );

  // ===================================================
  // SAVED EVENTS
  // ===================================================

  // Data Source
  sl.registerLazySingleton<SavedEventLocalDataSource>(
    () => SavedEventLocalDataSourceImpl(),
  );

  // Repository
  sl.registerLazySingleton<SavedEventRepository>(
    () => SavedEventRepositoryImpl(sl<SavedEventLocalDataSource>()),
  );

  // -------------------------
  // Use Cases
  // -------------------------

  sl.registerLazySingleton<GetSavedEventsUsecase>(
    () => GetSavedEventsUsecase(sl<SavedEventRepository>()),
  );

  sl.registerLazySingleton<ToggleSavedEventUsecase>(
    () => ToggleSavedEventUsecase(sl<SavedEventRepository>()),
  );

  // -------------------------
  // Bloc
  // -------------------------

  sl.registerFactory<SavedEventsBloc>(
    () => SavedEventsBloc(
      getSavedEventsUsecase: sl<GetSavedEventsUsecase>(),
      toggleSavedEventUsecase: sl<ToggleSavedEventUsecase>(),
    ),
  );

  // ===================================================
  // NAVIGATION
  // ===================================================

  sl.registerFactory<NavigationBloc>(() => NavigationBloc());

  // ===================================================
  // CONFIRMATION
  // ===================================================

  sl.registerFactory<ConfirmationBloc>(() => ConfirmationBloc());
}
