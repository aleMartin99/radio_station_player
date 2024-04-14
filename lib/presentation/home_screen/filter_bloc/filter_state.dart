// ignore_for_file: public_member_api_docs

part of 'filter_bloc.dart';

class FilterState {
  FilterState({this.isShowingOnlyFav = false});
  final bool isShowingOnlyFav;

  FilterState copyWith({bool? isShowingOnlyFav}) {
    return FilterState(
      isShowingOnlyFav: isShowingOnlyFav ?? this.isShowingOnlyFav,
    );
  }
}
