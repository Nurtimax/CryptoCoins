import 'package:Nurtimax/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:Nurtimax/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:Nurtimax/repositories/crypto_coins/modules/crypto_coin.dart';
import 'package:flutter/material.dart';

class Nurtimax extends StatefulWidget {
  const Nurtimax({
    super.key,
  });

  @override
  State<Nurtimax> createState() => _NurtimaxState();
}

class _NurtimaxState extends State<Nurtimax> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nurtimax'),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];

                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadCryptoCoin() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
