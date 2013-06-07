//
//  Card.h
//  Matchismo
//
//  Created by Daniela on 6/4/13.
//  Copyright (c) 2013 DL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString * contents;

@property (nonatomic,getter = isFaceup) BOOL faceUp;
@property (nonatomic,getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
