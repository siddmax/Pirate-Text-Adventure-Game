//
//  SSCharacterClass.h
//  Second Class
//
//  Created by Saurav Sharma on 9/11/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSWeaponClass.h"
#import "SSArmorClass.h"

@interface SSCharacterClass : NSObject

@property (strong, nonatomic) SSWeaponClass *weapon;
@property (strong, nonatomic) SSArmorClass *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
