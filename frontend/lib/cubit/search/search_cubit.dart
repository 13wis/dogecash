import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:frontend/models/search.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;

  SearchCubit({required SearchRepository searchRepository})
      : _searchRepository = searchRepository,
        super(const SearchState()) {
    _searchRepository.listenForDoges();
    _searchRepository.response
        .listen((event) => emit(state.copyWith(doges: event.doge)));
  }

  void searchChanged(String? value) {
    if (value?.isEmpty == false) {
      _searchRepository.addDogesRequest(value);
    }
    final search = Search.dirty(value);
    emit(state.copyWith(search: search, status: Formz.validate([search])));
  }
}
