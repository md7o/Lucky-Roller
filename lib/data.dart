import 'package:lucky_roller/models/category.dart';
import 'package:lucky_roller/models/roller.dart';

final data = {
  Category(
    id: '1',
    things: const [
      Hlao(spinName: 'McDonalds'),
      Hlao(spinName: 'KFC'),
      Hlao(spinName: 'Subway'),
      Hlao(spinName: 'Burger King'),
      Hlao(spinName: 'Pizza Hut'),
      Hlao(spinName: 'Domino'),
      Hlao(spinName: 'Krispy Kreme'),
      Hlao(spinName: 'Baskin Robbins'),
      Hlao(spinName: 'Little Caesars'),
      Hlao(spinName: 'Tim Hortons'),
      Hlao(spinName: 'Chuck E.Cheese'),
      Hlao(spinName: 'Canes Chicken'),
      Hlao(spinName: 'popeyes'),
      Hlao(spinName: 'Al baik'),
      Hlao(spinName: 'shawarmer'),
    ],
    items: const [
      Roller(
        name: 'Restaurant',
        imageUrl: "images/restaurant.png",
        spinName: 'c--',
      ),
    ],
  ),
  Category(
    id: '2',
    things: const [
      Hlao(spinName: 'M City'),
      Hlao(spinName: 'Arsenal'),
      Hlao(spinName: 'PSG'),
      Hlao(spinName: 'Barcelona'),
      Hlao(spinName: 'Real Madrid'),
      Hlao(spinName: 'Liverpool'),
      Hlao(spinName: 'Tottenham'),
      Hlao(spinName: 'M United'),
      Hlao(spinName: 'Napoli'),
      Hlao(spinName: 'Ac M'),
      Hlao(spinName: ' Dortmund'),
      Hlao(spinName: 'Roma'),
      Hlao(spinName: 'Juventus'),
      Hlao(spinName: 'Inter M'),
      Hlao(spinName: 'Bayern '),
      Hlao(spinName: 'atletico'),
      Hlao(spinName: 'Chelsea'),
      Hlao(spinName: 'Lyon'),
      Hlao(spinName: 'Leipzig'),
      Hlao(spinName: 'NewCastle'),
    ],
    items: const [
      Roller(
        name: 'Socer Teams',
        imageUrl: "images/team.png",
        spinName: 'c++',
      ),
    ],
  ),
  Category(
    id: '3',
    things: const [
      Hlao(spinName: 'FootBall'),
      Hlao(spinName: 'Table Tennis'),
      Hlao(spinName: 'Tennis'),
      Hlao(spinName: 'VolleyBall'),
      Hlao(spinName: 'BasketBall'),
      Hlao(spinName: 'Baseball'),
      Hlao(spinName: 'Golf'),
      Hlao(spinName: 'boxing'),
      Hlao(spinName: 'Bodybuilder'),
      Hlao(spinName: 'roller skating'),
      Hlao(spinName: 'bowling'),
      Hlao(spinName: 'ice hockey'),
      Hlao(spinName: 'Billiard'),
    ],
    items: const [
      Roller(
          name: 'Sports', imageUrl: "images/volleyball.png", spinName: 'c++'),
    ],
  ),
  Category(
    id: '4',
    things: const [
      Hlao(spinName: 'Breaking Bad'),
      Hlao(spinName: 'Chernobyl'),
      Hlao(spinName: 'The Wire'),
      Hlao(spinName: 'Avatar'),
      Hlao(spinName: 'Got'),
      Hlao(spinName: 'Sherlock'),
      Hlao(spinName: 'Twd'),
      Hlao(spinName: 'Black Mirror'),
      Hlao(spinName: 'HoD'),
      Hlao(spinName: 'Better call saul'),
      Hlao(spinName: 'Viking'),
      Hlao(spinName: 'Squid Game'),
      Hlao(spinName: 'Peaky Blinders'),
      Hlao(spinName: 'La casa'),
      Hlao(spinName: 'Mr Robot'),
      Hlao(spinName: 'Office'),
      Hlao(spinName: 'Narcos'),
      Hlao(spinName: 'Interstellar'),
    ],
    items: const [
      Roller(name: 'Series', imageUrl: "images/popcorn.png", spinName: 'c++'),
    ],
  ),
  Category(
    id: '5',
    things: const [
      Hlao(spinName: 'ًWin ✅'),
      Hlao(spinName: 'Lose ❌'),
      Hlao(spinName: 'Draw ⏺️')
    ],
    items: const [
      Roller(name: 'Result', imageUrl: "images/result.png", spinName: 'c++'),
    ],
  ),
};
