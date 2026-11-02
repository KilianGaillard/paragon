import 'package:flutter_test/flutter_test.dart';
import 'package:paragon/models/hand_model.dart';
import 'package:paragon/models/card_model.dart';
import 'package:paragon/core/poker_hand_evaluate.dart';

void main() {
  group('Tests du PokerHandEvaluate - Paragon', () {
    test('Évaluation d une High Card', () {
      // On simule une main avec 5 cartes déconnectées de même valeur maximale d'occurence = 1
      final hand = HandModel(cards: [
        CardModel(suit: Suit.hearts, rank: Rank.two),
        CardModel(suit: Suit.diamonds, rank: Rank.four),
        CardModel(suit: Suit.clubs, rank: Rank.six),
        CardModel(suit: Suit.spades, rank: Rank.eight),
        CardModel(suit: Suit.hearts, rank: Rank.ace),
      ]);
      final evaluator = PokerHandEvaluate(hand: hand);

      expect(evaluator.isHighCard(), isTrue,
          reason: "La main doit être reconnue comme une High Card.");
      expect(evaluator.isPair(), isFalse,
          reason: "Il ne doit pas y avoir de paire.");
    });

    test('Évaluation d une Pair', () {
      final hand = HandModel(cards: [
        CardModel(suit: Suit.hearts, rank: Rank.five),
        CardModel(suit: Suit.diamonds, rank: Rank.five),
        CardModel(suit: Suit.clubs, rank: Rank.two),
        CardModel(suit: Suit.spades, rank: Rank.nine),
        CardModel(suit: Suit.hearts, rank: Rank.jack),
      ]);

      final evaluator = PokerHandEvaluate(hand: hand);

      expect(evaluator.isPair(), isTrue,
          reason: "La main doit contenir une paire de 5.");
      expect(evaluator.isHighCard(), isFalse);
    });

    test('Évaluation d un Flush (Couleur)', () {
      final hand = HandModel(cards: [
        CardModel(suit: Suit.hearts, rank: Rank.two),
        CardModel(suit: Suit.hearts, rank: Rank.five),
        CardModel(suit: Suit.hearts, rank: Rank.seven),
        CardModel(suit: Suit.hearts, rank: Rank.jack),
        CardModel(suit: Suit.hearts, rank: Rank.king),
      ]);

      final evaluator = PokerHandEvaluate(hand: hand);

      expect(evaluator.isFlush(), isTrue,
          reason: "Toutes les cartes doivent être de la même couleur (Cœur).");
    });

    test('Évaluation d un Royal Flush', () {
      final hand = HandModel(cards : [
        CardModel(suit: Suit.spades, rank: Rank.ace),
        CardModel(suit: Suit.spades, rank: Rank.king),
        CardModel(suit: Suit.spades, rank: Rank.queen),
        CardModel(suit: Suit.spades, rank: Rank.jack),
        CardModel(suit: Suit.spades, rank: Rank.ten),
      ]);

      final evaluator = PokerHandEvaluate(hand: hand);

      expect(evaluator.isRoyalFlush(), isTrue,
          reason: "La main doit correspondre à une Quinte Flush Royale.");
    });

    test('Évaluation d une Full House', () {
      final hand = HandModel(cards : [
        CardModel(suit: Suit.spades, rank: Rank.ace),
        CardModel(suit: Suit.clubs, rank: Rank.ace),
        CardModel(suit: Suit.diamonds, rank: Rank.ace),
        CardModel(suit: Suit.hearts, rank: Rank.jack),
        CardModel(suit: Suit.spades, rank: Rank.jack),
      ]);

      final evaluator = PokerHandEvaluate(hand: hand);

      expect(evaluator.isFullHouse(), isTrue,
          reason: "La main doit correspondre à une Full House.");
      expect(evaluator.isThreeOfAKind(), isFalse,
          reason: "La main doit compter une Full House pas un Brelan");
      expect(evaluator.isTwoPairs(), isFalse,
          reason: "La main doit compter une Full House pas une Double Paire");
      expect(evaluator.isPair(), isFalse,
          reason: "La main doit compter une Full House pas une Paire");
    });
  });
}