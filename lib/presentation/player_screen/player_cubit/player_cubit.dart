// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_station_player/core/errors/failures.dart';
import 'package:radio_station_player/domain/entities/radio_station.dart';

part 'player_state.dart';
part 'player_status.dart';

//TODO add secure emit
class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(const PlayerState());

//TODO add load audio

  late AssetsAudioPlayer _player;

  /// Init AssetsAudioPlayer
  Future<void> initPlayer(RadioStation radioStation) async {
    try {
      _player = AssetsAudioPlayer.newPlayer();
      emit(state.copyWith(status: PlayerStatus.loading));
      _player.onErrorDo = (error) {
        error.player.stop();
      };
      await _player.open(
        Audio.liveStream(
          radioStation.url!,
          metas: Metas(
            title: radioStation.name,
            album: radioStation.country,
            artist: radioStation.countryCode,
            image: MetasImage.network(radioStation.image ?? ''),
          ),
        ),
        autoStart: false,
        showNotification: true,
        notificationSettings: const NotificationSettings(
          nextEnabled: false,
          prevEnabled: false,
          stopEnabled: false,
        ),
      );
      if (!isClosed) {
        emit(
          state.copyWith(
            status: PlayerStatus.initialized,
            player: _player,
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            failure: UnexpectedFailure(message: e.toString()),
            status: PlayerStatus.failure,
          ),
        );
      }
    }
  }

  Future<void> disposePlayer() async {
    try {
      emit(state.copyWith(status: PlayerStatus.loading));

      _player.dispose();
      if (!isClosed) {
        emit(
          state.copyWith(
            status: PlayerStatus.disposed,
          ),
        );
      }
    } on Exception catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            failure: UnexpectedFailure(message: e.toString()),
            status: PlayerStatus.failure,
          ),
        );
      }
    }
  }

  // Future<void> removeFromLocalCart(isar_.IsarCartItem isarCartItem) async {
  //   try {
  //     await isarDBHelper.removeItem(isarCartItem);
  //     final totalPrice = state.totalPrice -
  //         (isarCartItem.product!.price! * isarCartItem.amount!);

  //     if (!isClosed) {
  //       state.cartProductList.remove(isarCartItem);
  //       emit(state.copyWith(
  //           cartProductList: state.cartProductList,
  //           status: PlayerStatus.eliminatedProduct,
  //           totalPrice: double.tryParse(totalPrice.toStringAsFixed(2))));
  //     }
  //   } on Exception catch (e) {
  //     if (!isClosed) {
  //       emit(state.copyWith(exception: e, status: PlayerStatus.failure));
  //     }
  //   }
  // }

  // Future<void> addToLocalCart(isar_.IsarCartItem isarCartItem) async {
  //   try {
  //     emit(state.copyWith(status: PlayerStatus.loading));

  //     await navigatorKey.currentContext!.read<CartCubit>().loadLocalCart();

  //     await isarDBHelper.insertOne(isarCartItem);

  //     if (!isClosed) {
  //       var sameCartProducts = state.cartProductList.where(
  //           (element) => element.product!.id! == isarCartItem.product!.id!);
  //       if (sameCartProducts.isEmpty) {
  //         state.cartProductList.add(isarCartItem);
  //       }
  //       if (kDebugMode) {
  //         print(
  //             '======> productos del state del cartList ${state.cartProductList.length}');
  //       }
  //       emit(state.copyWith(
  //         status: PlayerStatus.addedProduct,
  //         // cartProductList: state.cartProductList
  //       ));
  //     }
  //   } on Exception catch (e) {
  //     if (!isClosed) {
  //       emit(state.copyWith(exception: e, status: PlayerStatus.failure));
  //     }
  //   }
  // }

  // Future<void> cleanLocalCart() async {
  //   try {
  //     emit(state.copyWith(status: CartStatus.loading));
  //     await isarDBHelper.instance.writeTxn(() async {
  //       await isarDBHelper.instance.isarCartItems.clear();
  //       //TODO implement dispose
  //       if (!isClosed) {
  //         state.cartProductList.clear();
  //         emit(state.copyWith(
  //           cartProductList: state.cartProductList,
  //           status: CartStatus.cleanedCart,
  //         ));
  //       }
  //     });
  //   } on Exception catch (e) {
  //     if (!isClosed) {
  //       emit(state.copyWith(exception: e, status: CartStatus.failure));
  //     }
  //   }
  // }
}
