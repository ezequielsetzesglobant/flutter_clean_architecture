import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/util/constants.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: Constants.detailsImageSize,
        child: ClipRRect(
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            placeholder: (context, url) => Image.asset(
              Constants.imageNotFound,
              width: Constants.detailsImageSize,
              height: Constants.detailsImageSize,
            ),
            imageUrl: url,
            errorWidget: (context, url, error) => Image.asset(
              Constants.imageNotFound,
              width: Constants.detailsImageSize,
              height: Constants.detailsImageSize,
            ),
          ),
        ),
      ),
    );
  }
}
