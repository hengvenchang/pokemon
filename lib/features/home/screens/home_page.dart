import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/home/bloc/home_bloc.dart';
import 'package:pokemon/features/home/models/home_model.dart';
import 'package:pokemon/features/home/widgets/item_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _newsBloc = HomeBloc();

  @override
  void initState() {
    _newsBloc.add(GetHomeList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemons')),
      body: _buildListPokemons(),
    );
  }

  Widget _buildListPokemons() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              Text(state.message!);
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                return _buildLoading();
              } else if (state is HomeLoading) {
                return _buildLoading();
              } else if (state is HomeLoaded) {
                return _buildCard(context, state.homeModel);
              } else if (state is HomeError) {
                return Text(state.message!);
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, HomeModel homeModel) {
    return ListView.builder(
      itemCount: homeModel.pokemons?.length,
      itemBuilder: (context, index) {
        return ItemContainer(
            pokemon: homeModel.pokemons?[index],
            pokemons: homeModel.pokemons,
            index: index);
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
