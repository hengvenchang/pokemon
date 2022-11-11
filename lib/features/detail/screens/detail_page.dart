import 'package:flutter/material.dart';
import 'package:pokemon/features/detail/widgets/property_container.dart';
import 'package:pokemon/features/detail/widgets/skill_container.dart';
import 'package:pokemon/styles/fonts.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class DetailPage extends StatefulWidget {
  final pokemon;
  final pokemons;
  final pokemonIndex;
  const DetailPage({super.key, this.pokemon, this.pokemons, this.pokemonIndex});

  @override
  State<DetailPage> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  PaletteGenerator? paletteGenerator;
  Color _dominateColor = const Color(0xffa0a0a0);
  Color _textColor = Colors.black;
  int currentIndex = 0;

  initState() {
    _getDominateColor(widget.pokemonIndex);
    currentIndex = widget.pokemonIndex;
  }

  @override
  Widget build(BuildContext context) {
    final Controller controller = Controller();
    controller.addListener((event) {
      _handleCallbackEvent(event.direction, event.success);
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _dominateColor,
        ),
        body: TikTokStyleFullPageScroller(
            contentSize: widget.pokemons.length,
            swipePositionThreshold: 0.2,
            swipeVelocityThreshold: 2000,
            animationDuration: const Duration(milliseconds: 400),
            controller: controller,
            builder: (BuildContext context, int index) =>
                _buildContent(index)));
  }

  Widget _buildContent(index) {
    final currentPokemon = widget.pokemons[currentIndex];
    return Container(
        height: double.infinity,
        color: _dominateColor,

        // using single scroll view just incase the description is too long
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildHeader(currentPokemon),
              FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  currentPokemon.imageurl,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text(
                    currentPokemon.xdescription,
                    style: TextStyle(
                        fontSize: FontSizeContants.body, color: _textColor),
                  )),
            ],
          ),
        )));
  }

  Widget buildHeader(currentPokemon) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PropertyContainer(pokemon: currentPokemon, textColor: _textColor),
          SkillContainer(pokemon: currentPokemon, textColor: _textColor),
        ]);
  }

  // getting dominate color from image for background container
  _getDominateColor(index) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(widget.pokemons[index].imageurl).image,
    );
    Color textColor =
        _dominateColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    Color? dColor;
    if (paletteGenerator.colors.isEmpty == false) {
      dColor = paletteGenerator.dominantColor?.color;
      setState(() {
        _dominateColor = dColor!;
        _textColor = textColor;
      });
    }
    return _dominateColor;
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success) {
    if (success == ScrollSuccess.SUCCESS) {
      updateScreenIndex(direction);
      _getDominateColor(currentIndex);
    }
  }

  void updateScreenIndex(ScrollDirection direction) {
    if (direction == ScrollDirection.FORWARD) {
      setState(() {
        currentIndex++;
      });
    } else {
      setState(() {
        currentIndex--;
      });
    }
  }
}
