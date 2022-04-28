import 'package:flutter/material.dart';
import '../bloc/event/species_event.dart';
import '../bloc/interface/i_species_bloc.dart';
import '../bloc/state/species_state.dart';
import '../widget/pokemon_details.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.title,
    required this.bloc,
    required this.speciesId,
  });

  final String title;
  final ISpeciesBloc bloc;
  final int speciesId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.getSpeciesState(
        speciesEvent: SpeciesGetSpecies(), speciesId: widget.speciesId);
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<SpeciesState>(
          initialData: SpeciesLoading(),
          stream: widget.bloc.speciesStream,
          builder: (context, AsyncSnapshot<SpeciesState> snapshot) {
            if (snapshot.hasData) {
              return PokemonDetails(
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
