//
//  LeftSlideDrawerViewController.m
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/2/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import "LeftSlideDrawerViewController.h"
#import "SettingItem.h"
#import "SearchItem.h"
#import "ButtonTableViewCell.h"
#import "SearchItemTableViewCell.h"
#import "SettingItemTableViewCell.h"
#import "WebDescriptionTableViewCell.h"

typedef NS_ENUM(NSUInteger, HeaderSectionCellType) {
    HeaderSectionCellType_Login,
    HeaderSectionCellType_Register,
    HeaderSectionCellType_MyPage,
    HeaderSectionCellType_RentalHistory
};

typedef NS_ENUM(NSUInteger, FAQSectionCellType) {
    FAQSectionCellType_Mail,
    FAQSectionCellType_WebDescription,
    FAQSectionCellType_AboutMTI,
    FAQSectionCellType_Logout
};

static NSInteger const kNumberOfSection = 4;
static CGFloat const kHeightOfTableHeaderView = 50.0;
static CGFloat const kHeightOfSectionHeaderView = 40.0;
static CGFloat const kHeightOfButtonCell = 80.0;
static CGFloat const kHeightOfDefaultCell = 50.0;
static CGFloat const kHeightOfWebDescriptionCell = 260.0;
static CGFloat const kPaddingLeft = 10.0;
static NSString *kNibButtonCell = @"ButtonTableViewCell";
static NSString *kRegisterCell = @"registerCell";
static NSString *kNibSearchCell = @"SearchItemTableViewCell";
static NSString *kSearchCell = @"searchCell";
static NSString *kNibSettingCell = @"SettingItemTableViewCell";
static NSString *kSettingCell = @"settingCell";
static NSString *kNibWebDescriptionCell = @"WebDescriptionTableViewCell";
static NSString *kWebDescriptionCell = @"webDescriptionCell";

@interface LeftSlideDrawerViewController ()<UITableViewDelegate, UITableViewDataSource, ButtonTableViewCellDelegate, WebDescriptionTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LeftSlideDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUp];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self updateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)setUp {
    [self.tableView registerNib:[UINib nibWithNibName:kNibButtonCell bundle:nil] forCellReuseIdentifier:kRegisterCell];
    [self.tableView registerNib:[UINib nibWithNibName:kNibSearchCell bundle:nil] forCellReuseIdentifier:kSearchCell];
    [self.tableView registerNib:[UINib nibWithNibName:kNibSettingCell bundle:nil] forCellReuseIdentifier:kSettingCell];
    [self.tableView registerNib:[UINib nibWithNibName:kNibWebDescriptionCell bundle:nil] forCellReuseIdentifier:kWebDescriptionCell];
}

- (void)updateUI {
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, kHeightOfTableHeaderView)];
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableHeaderView.bounds.size.width, tableHeaderView.bounds.size.height)];
    lblTitle.text = NSLocalizedString(@"Menu", nil);
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [tableHeaderView addSubview:lblTitle];
    
    self.tableView.tableHeaderView = tableHeaderView;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSArray *)dataForSection:(MenuSection)section {
    NSArray *datas = nil;
    switch (section) {
        case MenuSection_Header:
            datas = [self dataForHeaderSection];
            
            break;
        case MenuSection_Search:
            datas = [self dataForSearchSection];
            
            break;
        case MenuSection_Setting:
            datas = [self dataForSettingSection];
            
            break;
        case MenuSection_FAQ:
            datas = [self dataForFAQSection];
            
            break;
            
        default:
            break;
    }
    return datas;
}

- (NSArray *)dataForHeaderSection {
    
    return @[[NSNumber numberWithUnsignedInteger:HeaderSectionCellType_Login],
             [NSNumber numberWithUnsignedInteger:HeaderSectionCellType_Register]];
}

- (NSArray *)dataForSearchSection {
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    
    SearchItem *top = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Top", nil) andSelectable:NO];
    [datas addObject:top];
    
    SearchItem *genre = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Genre", nil) andSelectable:YES];
    [datas addObject:genre];
    
    SearchItem *digitalPriorRelease = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Digital prior release", nil) andSelectable:NO];
    [datas addObject:digitalPriorRelease];
    
    SearchItem *ranking = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Raking", nil) andSelectable:YES];
    [datas addObject:ranking];
    
    SearchItem *specialIssue = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Special issue", nil) andSelectable:YES];
    [datas addObject:specialIssue];
    
    SearchItem *newArrival = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"New arrival", nil) andSelectable:YES];
    [datas addObject:newArrival];
    
    SearchItem *goodValue = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Good value", nil) andSelectable:YES];
    [datas addObject:goodValue];
    
    SearchItem *staffRecommend = [[SearchItem alloc] initSearchItemWithName:NSLocalizedString(@"Staff recommend", nil) andSelectable:YES];
    [datas addObject:staffRecommend];
    
    return datas;
}

- (NSArray *)dataForSettingSection {
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    
    SettingItem *mediaNew = [[SettingItem alloc] initSettingItemWithName:NSLocalizedString(@"Media new", nil) andImageName:@"" andSelectable:NO];
    [datas addObject:mediaNew];
    
    SettingItem *info = [[SettingItem alloc] initSettingItemWithName:NSLocalizedString(@"Info", nil) andImageName:@"" andSelectable:NO];
    [datas addObject:info];
    
    SettingItem *pointHistory = [[SettingItem alloc] initSettingItemWithName:NSLocalizedString(@"Point history", nil) andImageName:@"" andSelectable:NO];
    [datas addObject:pointHistory];
    
    SettingItem *howTo = [[SettingItem alloc] initSettingItemWithName:NSLocalizedString(@"How to", nil) andImageName:@"" andSelectable:NO];
    [datas addObject:howTo];
    
    SettingItem *setting = [[SettingItem alloc] initSettingItemWithName:NSLocalizedString(@"Setting", nil) andImageName:@"" andSelectable:YES];
    [datas addObject:setting];
    
    SettingItem *aboutService = [[SettingItem alloc] initSettingItemWithName:NSLocalizedString(@"About service", nil) andImageName:@"" andSelectable:YES];
    [datas addObject:aboutService];
    
    return datas;
}

- (NSArray *)dataForFAQSection {
    
    return @[[NSNumber numberWithUnsignedInteger:FAQSectionCellType_Mail],
             [NSNumber numberWithUnsignedInteger:FAQSectionCellType_WebDescription],
             [NSNumber numberWithUnsignedInteger:FAQSectionCellType_AboutMTI]];
}

- (UITableViewCell *)defaultCellWithTitle:(NSString *)title andImageName:(NSString *)imageName {
    static NSString *defaultCell = @"defaultCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:defaultCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:defaultCell];
    }
    cell.textLabel.text = title;
    if (imageName.length > 0) {
        cell.imageView.image = [UIImage imageNamed:imageName];
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return kNumberOfSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *datas = [self dataForSection:section];
    
    return [datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *datas = [self dataForSection:indexPath.section];
    switch (indexPath.section) {
        case MenuSection_Header: {
            NSNumber *number = [datas objectAtIndex:indexPath.row];
            switch (number.unsignedIntegerValue) {
                case HeaderSectionCellType_Login:{
                    
                    return [self defaultCellWithTitle:NSLocalizedString(@"Login", nil) andImageName:@""];
                }
                    break;
                case HeaderSectionCellType_Register: {
                    ButtonTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kRegisterCell];
                    cell.delegate = self;
                    
                    return cell;
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case MenuSection_Search: {
            SearchItem *item = [datas objectAtIndex:indexPath.row];
            
            SearchItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kSearchCell];
            [cell loadDataForCell:item];
            
            return cell;
        }
            break;
        case MenuSection_Setting:{
            SettingItem *item = [datas objectAtIndex:indexPath.row];
            
            SettingItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kSettingCell];
            [cell loadDataForCell:item];
            
            return cell;
        }
            
            break;
        case MenuSection_FAQ:{
            NSNumber *number = [datas objectAtIndex:indexPath.row];
            switch (number.unsignedIntegerValue) {
                case FAQSectionCellType_Mail:
                    
                    return [self defaultCellWithTitle:NSLocalizedString(@"Mail", nil) andImageName:@""];
                    
                    break;
                case FAQSectionCellType_WebDescription:{
                    WebDescriptionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kWebDescriptionCell];
                    cell.delegate = self;
                    
                    return cell;
                }
                    break;
                case FAQSectionCellType_AboutMTI:
                    
                    return [self defaultCellWithTitle:NSLocalizedString(@"About MTI", nil) andImageName:@""];
                    
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = kHeightOfDefaultCell;
    NSArray *datas = [self dataForSection:indexPath.section];
    switch (indexPath.section) {
        case MenuSection_Header: {
            NSNumber *number = [datas objectAtIndex:indexPath.row];
            if (number.unsignedIntegerValue == HeaderSectionCellType_Register) {
                height = kHeightOfButtonCell;
            }
        }
            
            break;
        case MenuSection_FAQ: {
            NSNumber *number = [datas objectAtIndex:indexPath.row];
            if (number.unsignedIntegerValue == FAQSectionCellType_WebDescription) {
                height = kHeightOfWebDescriptionCell;
            }
        }
            
            break;
            
        default:
            break;
    }
    
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = kHeightOfSectionHeaderView;
    if (section == MenuSection_Header) {
        height = 0.0;
    }
    return height;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = nil;
    if (section != MenuSection_Header) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, kHeightOfSectionHeaderView)];
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(kPaddingLeft, 0, view.bounds.size.width - kPaddingLeft, view.bounds.size.height)];
        NSString *title = @"";
        switch (section) {
            case MenuSection_Search:
                title = NSLocalizedString(@"Search", nil);
                
                break;
            case MenuSection_Setting:
                title = NSLocalizedString(@"Setting", nil);
                
                break;
            case MenuSection_FAQ:
                title = NSLocalizedString(@"FAQ", nil);
                
                break;
                
            default:
                break;
        }
        lblTitle.text = title;
        [view addSubview:lblTitle];
    }
    
    return view;
}

#pragma mark - ButtonTableViewCellDelegate

- (void)didSelectAtButtonCell:(ButtonTableViewCell *)cell {
    
}

#pragma mark - WebDescriptionTableViewCellDelegate

- (void)didSelectAtDescriptionCell:(WebDescriptionTableViewCell *)cell {
    
}

@end
