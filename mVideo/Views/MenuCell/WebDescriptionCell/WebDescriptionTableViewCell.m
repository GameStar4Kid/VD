//
//  WebDescriptionTableViewCell.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/3/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "WebDescriptionTableViewCell.h"

@interface WebDescriptionTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgLogo;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnWeb;

@end

@implementation WebDescriptionTableViewCell

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
    //[self.imgLogo setImage:[UIImage imageNamed:@""]];
    self.lblTitle.text = NSLocalizedString(@"", nil);
    self.lblDescription.text = NSLocalizedString(@"", nil);
    [self.btnWeb setTitle:NSLocalizedString(@"", nil) forState:UIControlStateNormal];
}

- (IBAction)tappedAtWebButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectAtDescriptionCell:)]) {
        [self.delegate didSelectAtDescriptionCell:self];
    }
}

@end
