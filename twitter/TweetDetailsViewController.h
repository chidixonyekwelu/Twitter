//
//  TweetDetailsViewController.h
//  twitter
//
//  Created by Chidi Onyekwelu on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetDetailsViewController : UIViewController

@property (strong, nonatomic) Tweet *tweet;

@end

NS_ASSUME_NONNULL_END
