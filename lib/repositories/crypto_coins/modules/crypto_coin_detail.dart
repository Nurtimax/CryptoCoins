import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends Equatable {
  const CryptoCoinDetail({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  final double priceInUSD;
  final String imageUrl;
  final String toSymbol;
  final String lastUpdate;
  final String hight24Hour;
  final String low24Hours;

  @override
  List<Object> get props => [priceInUSD, imageUrl];
}
