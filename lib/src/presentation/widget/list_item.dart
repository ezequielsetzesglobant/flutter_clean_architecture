import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/util/constants.dart';
import '../../core/util/text_styles.dart';
import '../../domain/entity/pokemon_entity.dart';

class ListItem extends StatefulWidget {
  const ListItem({required this.pokemon});

  final PokemonEntity pokemon;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: Constants.itemListHeight,
              child: Padding(
                padding: const EdgeInsets.all(Constants.cardElementsPadding),
                child: ClipRRect(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(
                      Constants.imageNotFound,
                      width: Constants.imageSize,
                      height: Constants.imageSize,
                    ),
                    imageUrl: widget.pokemon.sprites.frontDefault,
                    errorWidget: (context, url, error) => Image.asset(
                      Constants.imageNotFound,
                      width: Constants.imageSize,
                      height: Constants.imageSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(Constants.cardElementsPadding),
                child: Container(
                  height: Constants.nameHeight,
                  width: Constants.nameWeight,
                  child: FittedBox(
                    child: Text(
                      widget.pokemon.name.toUpperCase(),
                      style: TextStyles.nameTextStyle,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(Constants.cardElementsPadding),
                    child: Text(
                      '${Constants.weightLabel} ${widget.pokemon.weight}',
                      style: TextStyles.weightTextStyle,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(Constants.cardElementsPadding),
                    child: Text(
                      '${Constants.heightLabel} ${widget.pokemon.height}',
                      style: TextStyles.heightTextStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
