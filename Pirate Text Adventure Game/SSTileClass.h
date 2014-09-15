//
//  SSTileClass.h
//  Second Class
//
//  Created by Saurav Sharma on 9/10/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSArmorClass.h"
#import "SSWeaponClass.h"

@interface SSTileClass : NSObject

@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *actionButtonName;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) SSWeaponClass *weapon;
@property (strong, nonatomic) SSArmorClass *armor;
@property (nonatomic) int healthChange;
@property (nonatomic) BOOL tilePast;

@end
