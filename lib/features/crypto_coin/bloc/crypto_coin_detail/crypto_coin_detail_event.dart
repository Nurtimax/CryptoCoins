part of 'crypto_coin_detail_bloc.dart';

abstract class CryptoCoinDetailEvent extends Equatable {
  const CryptoCoinDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoinDetal extends CryptoCoinDetailEvent {
  const LoadCryptoCoinDetal({
    required this.currencyCode,
  });

  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}
