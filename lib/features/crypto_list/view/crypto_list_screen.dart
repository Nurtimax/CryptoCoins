import 'dart:async';

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
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nurtimax'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoListEvent(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                  itemCount: state.coinsList.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              }

              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong',
                        style: theme.textTheme.headlineMedium,
                      ),
                      Text(
                        'Please try again later',
                        style:
                            theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptoListEvent());
                          },
                          child: const Text('Try again'))
                    ],
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
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
