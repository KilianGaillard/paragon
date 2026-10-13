import 'dart:math';
import 'card_model.dart';

/**
 * The class DeckModel describes the deck, which is the set of the cards
 * available during the game. During the game, this deck can be change : more
 * cards can be add, more examples of the same cards and others
 */
class DeckModel {
  List<CardModel> cards = [];

  /**
   * Generates a deck with all the differents cards defined in the card_model
   * Dart file
   */
  void generateDeck() {
    cards.clear();
    for(var suit in Suit.values) {
      for(var rank in Rank.values) {
        cards.add(CardModel(rank: rank, suit: suit));
      }
    }
  }

  /**
   * The method shuffle randomly shuffle the list of cards
   */
  void shuffle() {
    cards.shuffle(Random());
  }

  /**
   * This method takes a number of cards that are asked to draw from
   * the deck, and returns them, by taking them from the end of the deck
   * (the top of the pile of cards drew on the boardgame)
   * @ param count : the number of the cards we want to draw
   */
  List<CardModel> drawCards(int count) {
    List<CardModel> result = [];
    for(int i = 0; i < count; i++) {
      result.add(cards.removeLast());
    }
    return result;
  }

}