//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Chidi Onyekwelu on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void) refreshData {
    self.twitterUsername.text = self.tweet.user.name;
    self.twitterName.text = [NSString stringWithFormat: @"@%@", self.tweet.user.name];
    self.thisTweet.text = self.tweet.text;
    self.twitterDate.text = self.tweet.createdAtString;
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    self.profilePicture.image = [UIImage imageWithData:urlData];
    

}
- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    
    // Update UI
    // Setting our button (red)
    // Setting the button label (add 1)
    // If it's already been favorited, we want to unfavorite it (grey icon)
    if(self.tweet.favorited) {
        [self.likeTweet setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    // If it's hasn't been favorited, we want to favorite (red icon)
    else{
        // Update state (models)
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;

        // Update UI
        [self.likeTweet setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if (error) {
                NSLog(@"There was an error favoriting the tweet:%@", tweet);
            } else {
                NSLog(@"Successfully favorited tweet! %@", tweet);
            }
        }];
    }
    
    // Call our API
    
//    [self refreshData];
}

- (IBAction)didRetweet:(id)sender {
    self.tweet.retweeted = YES;
    self.tweet.retweetCount += 1;
        [self refreshData];
    
    if(self.tweet.retweeted) {
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    }
    else{
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }
    // TODO: Update cell UI
 // create image and passes the data to profile picture
    // TODO: Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if (error) {
            NSLog(@"There was an error retweeting the tweet:%@", tweet);
        } else {
            NSLog(@"Successfully retweeted tweet! %@", tweet);
        }
    }];
}
    // Configure the view for the selected state
  
  /*  - (void)configureView
    {
        if (self.detailItem) {
            NSDictionary *tweet = self.detailItem;

            NSString *text = [[tweet objectForKey:@"user"] objectForKey:@"name"];
            NSString *name = [tweet objectForKey:@"text"];

            tweetLabel.lineBreakMode = UILineBreakModeWordWrap;
            tweetLabel.numberOfLines = 0;

            nameLabel.text = text;
            tweetLabel.text = name;

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];

                dispatch_async(dispatch_get_main_queue(), ^{
                    profileImage.image = [UIImage imageWithData:data];
                });
            });
        }
    }
}
*/
@end
