part of 'search_cubit.dart';

class SearchState extends Equatable {
  final Search search;
  final FormzStatus status;
  final List<BaseDoge> doges;
  final String? errorMessage;

  const SearchState({
    this.search = const Search.pure(),
    this.status = FormzStatus.pure,
    this.doges = const [],
    this.errorMessage,
  });

  SearchState copyWith({
    Search? search,
    FormzStatus? status,
    List<BaseDoge>? doges,
    String? errorMessage,
  }) {
    return SearchState(
      search: search ?? this.search,
      status: status ?? this.status,
      doges: doges ?? this.doges,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isValid => status == FormzStatus.valid;
  bool get isSubmissionInProgress => status == FormzStatus.submissionInProgress;
  bool get isSubmissionFailure => status == FormzStatus.submissionFailure;
  bool get isSubmissionSuccess => status == FormzStatus.submissionSuccess;

  @override
  List<Object?> get props => [search, status, doges, errorMessage];
}
