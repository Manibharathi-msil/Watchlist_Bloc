import 'package:equatable/equatable.dart';
import '../model/model_item.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<ContactData> get props => [];
}

class WatchlistInitial extends ContactState {}

class ContactblocInitial extends ContactState {}

class ContactblocLoading extends ContactState {}

class ContactFetchData extends ContactState {
  List<ContactData> data;
  ContactFetchData({required this.data});
}

class ContactError extends ContactState {
  String msg;
  ContactError({required this.msg});
}
