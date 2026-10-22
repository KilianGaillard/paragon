/**
 * The Suit is the color of the card which is declined in four types,
 * such as in any card games
 */
enum Suit {
  hearts, spades, diamonds, clubs
}

/**
 * Rank is the number of the card, linked to its value in the game
 */
enum Rank {
  two(2,2), three(3,3), four(4,4), five(5,5), six(6,6), seven(7,7),
  eight(8,8), nine(9,9), ten(10,10), jockey(10,11), queen(10,12), king(10,13), ace(11,14);

  final int value;
  final int power;
  const Rank(this.value,this.power);

}
/**
 * The class CardModel corresponds to the object Card. Each card has a rank
 * which is the number of the card, directly linked with the value it is valued,
 * and a Suit, which is the color, the type of the card
 */
class CardModel {
  Rank rank;
  Suit suit;

  /**
   * The enchantment is a modifier on the card. It is a rare effect that can be applied,
   * and gives bonuses of multiplier or/and of points
   */
  String? enchantment;

  CardModel({required this.rank, required this.suit, this.enchantment});

  @override
  String toString() {
    return '${rank.name} of ${suit.name}';
  }
}

