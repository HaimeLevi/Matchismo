//
//  PlayingCard.h
//  Matchismo
//
//  Created by Daniela on 6/4/13.
//  Copyright (c) 2013 DL. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end