//
//  TweetCellTableViewCell.h
//  twitter
//
//  Created by Chidi Onyekwelu on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *thisTweet;
@property (weak, nonatomic) IBOutlet UIButton *likeTweet;
@property (weak, nonatomic) IBOutlet UIButton *retweet;
@property (weak, nonatomic) IBOutlet UIButton *replyTweet;
@property (weak, nonatomic) IBOutlet UILabel *twitterUsername;
@property (weak, nonatomic) IBOutlet UILabel *twitterName;


@end

NS_ASSUME_NONNULL_END
