//
//  SearchItemTableViewCell.h
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchItem;

@interface SearchItemTableViewCell : UITableViewCell

- (void)loadDataForCell:(SearchItem *)item;

@end
