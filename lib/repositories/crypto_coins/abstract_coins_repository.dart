import 'package:nurtimax/repositories/crypto_coins/modules/crypto_coin.dart';
import 'package:nurtimax/repositories/crypto_coins/modules/crypto_coin_detail.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode);
}
