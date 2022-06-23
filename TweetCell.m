//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by Chidi Onyekwelu on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
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
