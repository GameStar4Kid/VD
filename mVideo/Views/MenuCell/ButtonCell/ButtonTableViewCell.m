//
//  ButtonTableViewCell.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/3/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "ButtonTableViewCell.h"

@interface ButtonTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *btnRegister;

@end

@implementation ButtonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setUp];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUp {
    [self.btnRegister setTitle:NSLocalizedString(@"Register", nil) forState:UIControlStateNormal];
    self.backgroundColor = BACKGROUND_COLOR_MENU_ITEM;
}

- (IBAction)tappedAtRegisterButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectAtButtonCell:)]) {
        [self.delegate didSelectAtButtonCell:self];
    }
}

@end
