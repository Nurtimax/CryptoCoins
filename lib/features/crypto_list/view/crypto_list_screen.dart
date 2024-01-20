import 'package:Nurtimax/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:Nurtimax/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:Nurtimax/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Nurtimax extends StatefulWidget {
  const Nurtimax({
    super.key,
  });

  @override
  State<Nurtimax> createState() => _NurtimaxState();
}

class _NurtimaxState extends State<Nurtimax> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nurtimax'),
        ),
        body: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                itemBuilder: (context, i) {
                  final coin = state.coinsList![i];
                  return CryptoCoinTile(coin: coin);
                },
                itemCount: state.coinsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            }

            if (state is CryptoListLoadingFailure) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.exception?.toString() ?? 'Exception Error',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        // (_cryptoCoinsList == null)
        //     ? const Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         itemCount: _cryptoCoinsList!.length,
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinsList![i];

        //           return CryptoCoinTile(coin: coin);
        //         },
        //       ),
        );
  }
}
