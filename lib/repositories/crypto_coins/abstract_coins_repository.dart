import 'package:Nurtimax/repositories/crypto_coins/modules/crypto_coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
