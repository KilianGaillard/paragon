import 'package:flutter_test/flutter_test.dart';
import 'package:paragon/models/deck_model.dart';
import 'package:paragon/models/card_model.dart';

void main() {
  group('Tests du DeckModel - Poker Roguelike', () {

    test('Génération d un deck complet de 52 cartes', () {
      final deck = DeckModel();
      deck.generateDeck();

      // 4 suits (cœur, pique, carreau, trèfle) * 13 ranks = 52 cartes
      expect(deck.cards.length, 52, reason: "Le deck initial doit contenir exactement 52 cartes.");
    });

    test('Mélange du deck (Shuffle)', () {
      final deck1 = DeckModel();
      deck1.generateDeck();

      final deck2 = DeckModel();
      deck2.generateDeck();

      // On mélange le deuxième deck
      deck2.shuffle();

      // Les deux listes ne doivent plus être strictement identiques
      expect(deck1.cards, isNot(equals(deck2.cards)),
          reason: "Le mélange des cartes doit modifier l'ordre du paquet.");
    });

    test('Pioche des cartes (drawCards)', () {
      final deck = DeckModel();
      deck.generateDeck();
      deck.shuffle();

      const cardsToDraw = 7; // Conformément aux règles (7 cartes en main au début d'une manche)[cite: 1]
      final initialLength = deck.cards.length;

      final drawnCards = deck.drawCards(cardsToDraw);

      expect(drawnCards.length, cardsToDraw, reason: "Le nombre de cartes piochées doit correspondre.");
      expect(deck.cards.length, initialLength - cardsToDraw, reason: "Les cartes piochées doivent être retirées de la fin du paquet.");
    });
  });
}