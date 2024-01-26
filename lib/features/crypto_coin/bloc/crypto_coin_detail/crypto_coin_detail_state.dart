part of 'crypto_coin_detail_bloc.dart';

abstract class CryptoCoinDetailState extends Equatable {
  const CryptoCoinDetailState();

  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailInitial {}

class CryptoCoinDetailLoaded extends CryptoCoinDetailState {
  const CryptoCoinDetailLoaded(this.coinDetails);

  final CryptoCoinDetail coinDetails;

  @override
  List<Object?> get props => [coinDetails];
}

class CryptoCoinDetailLoading extends CryptoCoinDetailState {
  const CryptoCoinDetailLoading();
}

class CryptoCoinFailureLoading extends CryptoCoinDetailState {
  const CryptoCoinFailureLoading(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
