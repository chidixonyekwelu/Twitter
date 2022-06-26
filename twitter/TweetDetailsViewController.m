//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by Chidi Onyekwelu on 6/24/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TweetCell.h"


@interface TweetDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *likebutton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *replyTweetButton;
@property (weak, nonatomic) IBOutlet UILabel *profileTweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *profiledateLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileusernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profilenameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@end

@implementation TweetDetailsViewController
- (IBAction)likeButton:(id)sender {
    
}
- (IBAction)replytweetButton:(id)sender {
}
- (IBAction)retweetButton:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.tweet);
    self.profilenameLabel.text = self.tweet.user.name;
    self.profileusernameLabel.text = self.tweet.user.screenName;
    self.profiledateLabel.text = self.tweet.createdAtString;
    self.profileTweetLabel.text = self.tweet.text;
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    [self.profileImageView setImageWithURL:url];
    NSString *favoriteCountString = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    [self.likebutton setTitle:favoriteCountString forState:UIControlStateNormal];
    NSString *retweetCountString = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    [self.retweetButton setTitle:retweetCountString forState:UIControlStateNormal];
  //  self.profileImageView.image
}

@end
