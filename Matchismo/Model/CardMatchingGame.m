//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Daniela on 6/8/13.
//  Copyright (c) 2013 DL. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong,nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *resultDescription;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.isFaceup) {
            int countOtherCardsFaceUp = 0;
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceup && !otherCard.isUnplayable) {
                    countOtherCardsFaceUp++;
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        self.resultDescription = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", otherCard.contents, card.contents, matchScore * MATCH_BONUS];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.resultDescription = [NSString stringWithFormat:@"%@ & %@ don't match! %d points penalty!", otherCard.contents, card.contents, MISMATCH_PENALTY];
                    }
                    break;
                }
            }
            if (!countOtherCardsFaceUp) {
                self.resultDescription = [NSString stringWithFormat:@"Flipped up %@ ", card.contents];
            }
                self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceup;
    }
}

@end
