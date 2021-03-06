//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TweetCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "TweetDetailsViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
@property(strong, nonatomic) UIRefreshControl *refreshcontrol;
@end

@implementation TimelineViewController

    

- (IBAction)didTapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    [[APIManager shared] logout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.refreshcontrol = [[UIRefreshControl alloc] init];
    [self.refreshcontrol addTarget:self action:@selector(loadTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshcontrol atIndex:0];
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}
    // Get timeline
    
- (void)loadTweets {
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.arrayOfTweets = (NSMutableArray*) tweets;

            NSLog(@"😎😎😎 Successfully loaded home timeline");
            for (Tweet *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
            }
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.tableView reloadData];
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfTweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Tweet" forIndexPath:indexPath];
    Tweet *tweet = self.arrayOfTweets[indexPath.row];
    cell.tweet = tweet;
    
    cell.twitterUsername.text = tweet.user.name;
    cell.twitterName.text = [NSString stringWithFormat: @"@%@", tweet.user.name];
    cell.thisTweet.text = tweet.text;
    cell.twitterDate.text = tweet.createdAtString;
    
    NSString *URLString = tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    cell.profilePicture.image = [UIImage imageWithData:urlData]; // create image and passes the data to profile picture
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"composeSegue"]) {
        UINavigationController *navigationController = [segue destinationViewController];
            ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
            composeController.delegate = self;
    //     Get the new view controller using [segue destinationViewController].
         UITableViewCell *MyCell = sender;
        NSIndexPath *IndexPath = [self.tableView indexPathForCell:MyCell];
    }
    else if ([[segue identifier] isEqualToString:@"detailsSegue"]) {
        TweetDetailsViewController *tweetdetailsviewController = [segue destinationViewController];
        TweetCell *cell = (TweetCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Tweet *thisTweet = self.arrayOfTweets[indexPath.row];
        tweetdetailsviewController.tweet = thisTweet;
        
    }

    
    
//    if ([[segue identifier] isEqualToString:@"composeSegue"]) {
//        UINavigationController *navigationController = [segue destinationViewController];
//            ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
//            composeController.delegate = self;
//    //     Get the new view controller using [segue destinationViewController].
//         UITableViewCell *MyCell = sender;
//        NSIndexPath *IndexPath = [self.tableView indexPathForCell:MyCell];
//    }
    // Pass the selected object to the new view controller.
}




- (void)didTweet:(nonnull Tweet *)tweet {
    [self.arrayOfTweets insertObject:tweet atIndex:0];
    [self.tableView reloadData];

}

@end
