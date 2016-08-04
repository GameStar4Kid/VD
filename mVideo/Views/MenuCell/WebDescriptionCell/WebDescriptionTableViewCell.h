//
//  WebDescriptionTableViewCell.h
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/3/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebDescriptionTableViewCellDelegate;

@interface WebDescriptionTableViewCell : UITableViewCell

@property (nonatomic, weak) id<WebDescriptionTableViewCellDelegate> delegate;

@end

@protocol WebDescriptionTableViewCellDelegate <NSObject>

- (void)didSelectAtDescriptionCell:(WebDescriptionTableViewCell *)cell;

@end
