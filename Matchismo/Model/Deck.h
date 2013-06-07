//
//  Deck.h
//  Matchismo
//
//  Created by Daniela on 6/4/13.
//  Copyright (c) 2013 DL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

@end
