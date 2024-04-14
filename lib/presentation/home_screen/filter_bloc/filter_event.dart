// ignore_for_file: public_member_api_docs

part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {}

class OnToggleFavoriteFilterEvent extends FilterEvent {
  OnToggleFavoriteFilterEvent({required this.isShowingOnlyFav});

  /// Favorite filter status
  final bool isShowingOnlyFav;

  @override
  List<Object> get props => [isShowingOnlyFav];
}
