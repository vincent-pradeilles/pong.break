//
//  PBGameManager.m
//  Pong Break!
//
//  Created by Vincent on 12/07/2015.
//  Copyright © 2015 Vincent. All rights reserved.
//

#import "PBGameManager.h"

@interface PBGameManager ()

@property (nonatomic) NSInteger currentLevel;
@property (nonatomic) NSInteger bestScore;

@end

@implementation PBGameManager

static const NSInteger FIRST_LEVEL = 1;
static NSString *BEST_SCORE_USER_DEFAULTS_KEY = @"game.manager.best.score";

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.currentLevel = FIRST_LEVEL;
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        self.bestScore = [userDefaults integerForKey:BEST_SCORE_USER_DEFAULTS_KEY];
    }
    
    return self;
}

- (void)setBestScore:(NSInteger)bestScore
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:bestScore forKey:BEST_SCORE_USER_DEFAULTS_KEY];
    [userDefaults synchronize];
    
    _bestScore = bestScore;
}

- (void)completedCurrentLevel
{
    if (self.currentLevel > self.bestScore) {
        self.bestScore = self.currentLevel;
    }
    
    self.currentLevel++;
}

- (void)failedCurrentLevel
{
    self.currentLevel = FIRST_LEVEL;
}

@end
