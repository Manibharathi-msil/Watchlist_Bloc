import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc_pattern/bloc/watchlist_event.dart';
import 'package:watchlist_bloc_pattern/bloc/watchlist_state.dart';
import '../service/contact_resp.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository _contactRepo;

  ContactBloc(this._contactRepo) : super(WatchlistInitial()) {
    on<ContactEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(ContactblocLoading());
        try {
          final items = await _contactRepo.fetchContact();
          emit(ContactFetchData(data: items));
        } catch (e) {
          emit(ContactError(msg: e.toString()));
        }
      }
    });
  }
}
