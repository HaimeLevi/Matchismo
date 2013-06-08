//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Daniela on 6/8/13.
//  Copyright (c) 2013 DL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Designated Initializer
- (id) initWithCardCount:(NSUInteger)cardCount
               usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *) cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;


@end
