import 'package:paragon/models/hand_model.dart';
import 'package:paragon/models/card_model.dart';

enum PokerHand {
  HighCard(5,1), Pair(10,2), TwoPair(20,2), ThreeOfAKind(30,3),
  Straight(30,4), Flush(35,4), FullHouse(40,4),
  FourOfAKind(60,7), StraightFlush(100,8), RoyalFlush(100,10);

  final int value;
  final int mult;
  const PokerHand(this.value,this.mult);

}

class PokerHandEvaluate {
  HandModel hand;

  PokerHandEvaluate({required this.hand});

  bool isRoyalFlush(){
    int power_init = 14;
    int count = 0;
    int i = 0;
    Suit color = hand.cards.first.suit;
    if(hand.cards.length!=5){
      return false;
    }
    for(CardModel card in hand.cards){
      if((hand.cards[i].rank.power==power_init-i)&&(hand.cards[i].suit==color)){
        count++;
      }
    }
    if(count==5){
      return true;
    }
    else {
      return false;
    }
  }
}
