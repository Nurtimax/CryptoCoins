import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nurtimax/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:nurtimax/repositories/crypto_coins/modules/crypto_coin_detail.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_coin_detail_event.dart';
part 'crypto_coin_detail_state.dart';

class CryptoCoinDetailsBloc
    extends Bloc<CryptoCoinDetailEvent, CryptoCoinDetailState> {
  CryptoCoinDetailsBloc(this.coinsRepository)
      : super(CryptoCoinDetailInitial() as CryptoCoinDetailState) {
    on<LoadCryptoCoinDetal>(_load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(
    LoadCryptoCoinDetal event,
    Emitter<CryptoCoinDetailState> emit,
  ) async {
    if (state is! CryptoCoinDetailLoaded) {
      emit(const CryptoCoinDetailLoading());
    }

    final coinDetails =
        await coinsRepository.getCoinDetails(event.currencyCode);

    emit(CryptoCoinDetailLoaded(coinDetails));
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
