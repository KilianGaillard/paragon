import 'dart:collection';

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

  Map<int,int> generateHandMap(){
    Map<int,int> hand_map = {};
    for(CardModel card in hand.cards) {
      hand_map[card.rank.power] = (hand_map[card.rank.power]??0)+1;
    }
    return hand_map;
  }

  bool isRoyalFlush(){
    int power_init = 14;
    int count = 0;
    int i = 0;
    Suit color = hand.cards.first.suit;
    if(hand.cards.length!=5){
      return false;
    }
    for(CardModel card in hand.cards){
      if((card.rank.power==power_init-i)&&(card.suit==color)){
        count++;
      }
      i++;
    }
    if(count==5){
      return true;
    }
    else {
      return false;
    }
  }

  bool isStraightFlush(){
    int count = 0;
    int i = 0;
    int power_init = hand.cards.first.rank.power;
    Suit color = hand.cards.first.suit;
    if(hand.cards.length!=5){
      return false;
    }
    for(CardModel card in hand.cards){
      if((card.rank.power==power_init-i)&&(card.suit==color)){
        count++;
      }
      i++;
    }
    if(count==5){
      return true;
    }
    else {
      return false;
    }
  }

  bool isFourOfAKind(){
    int count = 0;
    int power_init = hand.cards.first.rank.power;
    if(hand.cards.length<4){
      return false;
    }
    for(CardModel card in hand.cards){
      if(card.rank.power==power_init){
        count++;
      }
    }
    if(count==4){
      return true;
    }
    else {
      return false;
    }
  }

  bool isFullHouse(){
    if(hand.cards.length==5){
      Map<int,int> hand_map = generateHandMap();
      if(hand_map.length==2){
        if(hand_map[0]==3||hand_map[1]==3){
          return true;
        }
      } else {
        return false;
      }
    }
    return false;
  }

  bool isFlush(){
    int count = 0;
    Suit color = hand.cards.first.suit;
    if(hand.cards.length!=5){
      return false;
    }
    for(CardModel card in hand.cards){
      if(card.suit==color){
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

  bool isStraight(){
    int count = 0;
    int i = 0;
    int power_init = hand.cards.first.rank.power;
    if(hand.cards.length!=5){
      return false;
    }
    for(CardModel card in hand.cards){
      if(card.rank.power==power_init-i){
        count++;
      }
      i++;
    }
    if(count==5){
      return true;
    }
    else {
      return false;
    }
  }

  bool isThreeOfAKind(){
    Map<int,int> hand_map = generateHandMap();
    if(hand_map.length==3){
      if(hand_map[0]==3||hand_map[1]==3){
        return true;
      }
    } else {
      return false;
    }
    return false;
  }
}
