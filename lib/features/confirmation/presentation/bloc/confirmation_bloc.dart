import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/booking_confirmation_model.dart';
import 'confirmation_event.dart';
import 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  ConfirmationBloc() : super(ConfirmationInitial()) {
    on<LoadBookingDetails>(_onLoadBookingDetails);
    on<ViewTicketsPressed>(_onViewTicketsPressed);
    on<AddToWalletPressed>(_onAddToWalletPressed);
    on<AddToCalendarPressed>(_onAddToCalendarPressed);
    on<SharePressed>(_onSharePressed);
    on<ReturnToHomePressed>(_onReturnToHomePressed);
  }

  Future<void> _onLoadBookingDetails(
    LoadBookingDetails event,
    Emitter<ConfirmationState> emit,
  ) async {
    log('🔵 LoadConfirmation started');

    emit(ConfirmationLoading());

    await Future.delayed(const Duration(milliseconds: 600));

    emit(ConfirmationLoaded(BookingConfirmationModel.mock()));
  }

  void _onViewTicketsPressed(
    ViewTicketsPressed event,
    Emitter<ConfirmationState> emit,
  ) {
    final currentState = state;

    if (currentState is ConfirmationLoaded) {
      emit(
        ConfirmationActionSuccess('View Tickets', currentState.bookingDetails),
      );

      emit(ConfirmationLoaded(currentState.bookingDetails));
    }
  }

  void _onAddToWalletPressed(
    AddToWalletPressed event,
    Emitter<ConfirmationState> emit,
  ) {
    final currentState = state;

    if (currentState is ConfirmationLoaded) {
      emit(
        ConfirmationActionSuccess(
          'Added to Wallet',
          currentState.bookingDetails,
        ),
      );

      emit(ConfirmationLoaded(currentState.bookingDetails));
    }
  }

  void _onAddToCalendarPressed(
    AddToCalendarPressed event,
    Emitter<ConfirmationState> emit,
  ) {
    final currentState = state;

    if (currentState is ConfirmationLoaded) {
      emit(
        ConfirmationActionSuccess(
          'Added to Calendar',
          currentState.bookingDetails,
        ),
      );

      emit(ConfirmationLoaded(currentState.bookingDetails));
    }
  }

  void _onSharePressed(SharePressed event, Emitter<ConfirmationState> emit) {
    final currentState = state;

    if (currentState is ConfirmationLoaded) {
      emit(
        ConfirmationActionSuccess(
          'Share Link Copied',
          currentState.bookingDetails,
        ),
      );

      emit(ConfirmationLoaded(currentState.bookingDetails));
    }
  }

  void _onReturnToHomePressed(
    ReturnToHomePressed event,
    Emitter<ConfirmationState> emit,
  ) {
    final currentState = state;

    if (currentState is ConfirmationLoaded) {
      emit(
        ConfirmationActionSuccess(
          'Returning to Home Screen',
          currentState.bookingDetails,
        ),
      );

      emit(ConfirmationLoaded(currentState.bookingDetails));
    }
  }
}
