//
//  SearchItemTableViewCell.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "SearchItemTableViewCell.h"
#import "SearchItem.h"

@interface SearchItemTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgArrow;

@end

@implementation SearchItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = BACKGROUND_COLOR_MENU_ITEM;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadDataForCell:(SearchItem *)item {
    self.lblTitle.text = item.name;
    if (!item.selectable) {
        self.imgArrow.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}

@end
