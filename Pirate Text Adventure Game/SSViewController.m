//
//  SSViewController.m
//  Pirate Text Adventure Game
//
//  Created by Saurav Sharma on 9/11/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import "SSViewController.h"
#import "SSFactoryClass.h"
#import "SSTileClass.h"

@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    SSFactoryClass *factory = [[SSFactoryClass alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0,0);
    [self updateCharacterStatsforArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateDirectionButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    SSTileClass *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    tile.tilePast = NO;
    
    if ([tile.actionButtonName  isEqual: @"Attack Boss"]) {
        self.boss.health = self.boss.health - self.character.damage;
        self.character.health = self.character.health - self.boss.damage - self.character.armor.health;
        self.character.damage = self.character.damage - self.character.weapon.damage;
    }
    else {
        [self updateDirectionButtons];
    }
    
    [self updateCharacterStatsforArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthChange];
    
    [self updateTile];
    
    [self.actionButton setTitle:@"" forState:UIControlStateNormal];
    [self.actionButton setHidden:YES];
    
    if (self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Death Message" message:@"Sadly, you have died. You have failed your family! Try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
    else if (self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Victory Message" message:@"You defeated the Pirate Boss! Your family can rest in peace at last. Congratulations!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
    else if ([tile.actionButtonName  isEqual: @"Take Moonlight Sword"]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Ultimate Weapon" message:@"You received the Moonlight Blade! With this you can defeat the Pirate Boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    else if ([tile.actionButtonName  isEqual: @"Take Diamond Armor"]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Ultimate Armor" message:@"You received the Diamond Armor! With this you can defeat the Pirate Boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateTile];
    [self updateDirectionButtons];
    [self.westButton setHidden:YES];
    [self.eastButton setHidden:YES];
    [self.northButton setHidden:YES];
    [self.southButton setHidden:YES];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateTile];
    [self updateDirectionButtons];
    [self.westButton setHidden:YES];
    [self.eastButton setHidden:YES];
    [self.northButton setHidden:YES];
    [self.southButton setHidden:YES];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateTile];
    [self updateDirectionButtons];
    [self.westButton setHidden:YES];
    [self.eastButton setHidden:YES];
    [self.northButton setHidden:YES];
    [self.southButton setHidden:YES];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateTile];
    [self updateDirectionButtons];
    [self.westButton setHidden:YES];
    [self.eastButton setHidden:YES];
    [self.northButton setHidden:YES];
    [self.southButton setHidden:YES];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

-(void)updateTile
{
    SSTileClass *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    SSTileClass *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    self.storyLabel.text = tileModel.story;
    self.backgroundImage.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    [self.actionButton setHidden:NO];
    
    if ([tile.actionButtonName isEqualToString:@"Attack Boss"]){
        [self.bossHealthLabel setHidden:NO];
        self.bossHealthLabel.text = [NSString stringWithFormat:@"Boss Health: %i", self.boss.health];
    }
    else {
        [self.bossHealthLabel setHidden:YES];
    }
}

-(void)updateDirectionButtons
{
    if ([self tileExistsatPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)] && [self tileDone:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)]) {
        self.northButton.hidden = NO;
    }
    else {
        self.northButton.hidden = YES;
    }
    
    if ([self tileExistsatPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)] && [self tileDone:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)]) {
        self.westButton.hidden = NO;
    }
    else {
        self.westButton.hidden = YES;
    }
    
    if ([self tileExistsatPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)] && [self tileDone:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)]) {
        self.eastButton.hidden = NO;
    }
    else {
        self.eastButton.hidden = YES;
    }
    
    if ([self tileExistsatPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)] && [self tileDone:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)]) {
        self.southButton.hidden = NO;
    }
    else {
        self.southButton.hidden = YES;
    }
    
//    self.westButton.hidden = [self tileExistsatPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
//    self.eastButton.hidden = [self tileExistsatPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
//    self.northButton.hidden = [self tileExistsatPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
//    self.southButton.hidden = [self tileExistsatPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
//    
//    self.westButton.hidden = [self tileDone:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
//    self.eastButton.hidden =[self tileDone:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
//    self.northButton.hidden = [self tileDone:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
//    self.southButton.hidden = [self tileDone:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)tileDone: (CGPoint)point
{
    SSTileClass *tile = [[self.tiles objectAtIndex:point.x] objectAtIndex:point.y];
    
    if (tile.tilePast == YES) {
        return YES;
    }
    else {
        return NO;
    }
}

-(BOOL)tileExistsatPoint: (CGPoint)point
{
//    SSTileClass *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (point.y >= 0 && point.x >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x]count]/* && tile.tilePast == YES*/) {
        return YES;
    }
    else {
        return NO;
    }
}

-(void)updateCharacterStatsforArmor:(SSArmorClass *)armor withWeapons:(SSWeaponClass *)weapon withHealthEffect:(int)healthChange
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    
    else if (healthChange != 0) {
        self.character.health = self.character.health + healthChange;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}
@end
