part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {}

class LoadCryptoListEvent extends CryptoListEvent {
  LoadCryptoListEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
