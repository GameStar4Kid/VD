//
//  SettingItemTableViewCell.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "SettingItemTableViewCell.h"
#import "SettingItem.h"

@interface SettingItemTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgArrow;

@end

@implementation SettingItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = BACKGROUND_COLOR_MENU_ITEM;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadDataForCell:(SettingItem *)item {
    self.lblTitle.text = item.name;
    //self.imgView.image = [UIImage imageNamed:item.imageName];
    if (!item.selectable) {
        self.imgArrow.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}

@end
