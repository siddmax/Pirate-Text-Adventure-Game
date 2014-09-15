//
//  SSFactoryClass.h
//  Second Class
//
//  Created by Saurav Sharma on 9/10/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCharacterClass.h"
#import "SSBossClass.h"

@interface SSFactoryClass : NSObject

-(NSArray*)tiles;
-(SSCharacterClass *)character;
-(SSBossClass *)boss;

@end
