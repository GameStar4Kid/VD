//
//  ButtonTableViewCell.h
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/3/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonTableViewCellDelegate;

@interface ButtonTableViewCell : UITableViewCell

@property (nonatomic, weak) id<ButtonTableViewCellDelegate> delegate;

@end

@protocol ButtonTableViewCellDelegate <NSObject>

- (void)didSelectAtButtonCell:(ButtonTableViewCell *)cell;

@end
