//
//  SSFactoryClass.m
//  Second Class
//
//  Created by Saurav Sharma on 9/10/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import "SSFactoryClass.h"
#import "SSTileClass.h"
#import "SSBossClass.h"

@implementation SSFactoryClass

-(NSArray*)tiles
{
    SSTileClass *tile1 = [[SSTileClass alloc] init];
    tile1.story = @"Your family has been killed by the Pirate Boss. Exact your revenge by becoming a pirate and going on a voyage to exact your revenge on the Pirate Boss. Here is a Blunt Sword.";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    SSWeaponClass *bluntedSword = [[SSWeaponClass alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take Blunted Sword";
    tile1.tilePast = YES;
    
    SSTileClass *tile2 = [[SSTileClass alloc] init];
    tile2.story = @"Squawk! A parrot has appeared. It takes a liking to you... It likes you enough to kill you! Kill it first!.";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile2.healthChange = -10;
    tile2.actionButtonName = @"Fight Parrot";
    tile2.tilePast = YES;
    
    SSTileClass *tile3 = [[SSTileClass alloc] init];
    tile3.story = @"You found a pile of treasure! Glittering on the pile is Bronze Armor!";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    SSArmorClass *bronzeArmor = [[SSArmorClass alloc] init];
    bronzeArmor.name = @"Bronze Armor";
    bronzeArmor.health = 20;
    tile3.armor = bronzeArmor;
    tile3.actionButtonName = @"Take Bronze Armor";
    tile3.tilePast = YES;
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    SSTileClass *tile4 = [[SSTileClass alloc] init];
    tile4.story = @"AHHH its an Octopus! Kill it, kill it! Wait is that a sword in its tentacle...";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    SSWeaponClass *ironSword = [[SSWeaponClass alloc] init];
    ironSword.name = @"Iron Sword";
    ironSword.damage = 18;
    tile4.weapon = ironSword;
    tile4.healthChange = -15;
    tile4.actionButtonName = @"Take Iron Sword";
    tile4.tilePast = YES;
    
    SSTileClass *tile5 = [[SSTileClass alloc] init];
    tile5.story = @"A friendly blacksmith has appeared. He wishes to give you a new weapon to fight the Pirate Boss that killed his family!";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    SSWeaponClass *steelSword = [[SSWeaponClass alloc] init];
    steelSword.name = @"Steel Sword";
    steelSword.damage = 21;
    tile5.weapon = steelSword;
    tile5.actionButtonName = @"Take Steel Sword";
    tile5.tilePast = YES;
    
    SSTileClass *tile6 = [[SSTileClass alloc] init];
    tile6.story = @"Arrr you have to walk the plank. Lose some health and get back on your feet!";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthChange = -20;
    tile6.actionButtonName = @"Walk Plank";
    tile6.tilePast = YES;
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    SSTileClass *tile7 = [[SSTileClass alloc] init];
    tile7.story = @"You've arrived at a friendly dock. Stock up on some food to regain your health before you face off against the Pirate Boss!";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile7.healthChange = 50;
    tile7.actionButtonName = @"Rest up";
    tile7.tilePast = YES;
    
    SSTileClass *tile8 = [[SSTileClass alloc] init];
    tile8.story = @"Its a pirate attack from the cronies of the Pirate Boss! This is the start of your revenge! Kill them and avenge your siblings that they killed!";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile8.healthChange = -20;
    tile8.actionButtonName = @"Fight Pirates";
    tile8.tilePast = YES;
    
    SSTileClass *tile9 = [[SSTileClass alloc] init];
    tile9.story = @"You found another pile of Treasure! Lo and behold, its the ultimate Diamond Armor!";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    SSArmorClass *diamondArmor = [[SSArmorClass alloc] init];
    diamondArmor.name = @"Diamond Armor";
    diamondArmor.health = 40;
    tile9.armor = diamondArmor;
    tile9.actionButtonName = @"Take Diamond Armor";
    tile9.tilePast = YES;
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    SSTileClass *tile10 = [[SSTileClass alloc] init];
    tile10.story = @"The nefarious crew of the Pirate Boss have laid a trap for your ship! It seems like a last ditch effort from the Pirate Boss to prevent you from challenging him. Survive to achieve your revenge!";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile10.healthChange = -30;
    tile10.actionButtonName = @"Escape the trap";
    tile10.tilePast = YES;
    
    SSTileClass *tile11 = [[SSTileClass alloc] init];
    tile11.story = @"You've stumbled across a secret weapons cache that the Pirate Boss was hiding from authorities. While plundering it, you found the legendary Moonlight Sword!";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    SSWeaponClass *moonlightSword = [[SSWeaponClass alloc] init];
    moonlightSword.name = @"Moonlight Sword";
    moonlightSword.damage = 30;
    tile11.weapon = moonlightSword;
    tile11.actionButtonName = @"Take Moonlight Sword";
    tile11.tilePast = YES;
    
    SSTileClass *tile12 = [[SSTileClass alloc] init];
    tile12.story = @"Yo hore, welcome to the den of the Pirate Boss! Will you be able to defeat him? Run away if your health gets too low, collect better armor/weapons, and try again.";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile12.actionButtonName = @"Attack Boss";
    tile12.tilePast = YES;
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
    
//    NSArray *columnArrayFirst = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];
//    NSArray *columnArraySecond = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];
//    NSArray *columnArrayThird = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];
//    NSArray *columnArrayFourth = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];
//    
//    NSArray *tilesArray = [[NSArray alloc] initWithObjects:columnArrayFirst, columnArraySecond, columnArrayThird, columnArrayFourth, nil];
}

-(SSCharacterClass *)character
{
    SSCharacterClass *character = [[SSCharacterClass alloc] init];
    SSArmorClass *armor = [[SSArmorClass alloc] init];
    SSWeaponClass *weapon = [[SSWeaponClass alloc] init];
    
    character.health = 100;
    character.damage = 2;
    
    character.armor = armor;
    armor.name = @"Shirt";
    armor.health = 5;
    
    character.weapon = weapon;
    weapon.name = @"Fists";
    weapon.damage = 2;
    
    return character;
}

-(SSBossClass *)boss
{
    SSBossClass *boss = [[SSBossClass alloc]init];
    
    boss.health = 65;
    boss.damage = 15;
    
    return boss;
}

@end
