import 'package:flutter/material.dart';
import '../bloc/event/pokedex_event.dart';
import '../bloc/interface/i_pokedex_bloc.dart';
import '../bloc/state/pokedex_state.dart';
import '../widget/pokemons_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.title,
    required this.bloc,
  });

  final String title;
  final IPokedexBloc bloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.getPokedexState(PokedexGetPokemonIds());
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<PokedexState>(
          initialData: PokedexLoading(),
          stream: widget.bloc.pokedexStream,
          builder: (context, AsyncSnapshot<PokedexState> snapshot) {
            if (snapshot.hasData) {
              return PokemonsList(
                data: snapshot.data!,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
