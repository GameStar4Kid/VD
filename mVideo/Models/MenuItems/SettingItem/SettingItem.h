//
//  SettingItem.h
//  mVideo
//
//  Created by Nguyen Xuan Tho on 8/4/16.
//  Copyright © 2016 IVC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *imageName;
@property (nonatomic, readonly) BOOL selectable;

- (instancetype)initSettingItemWithName:(NSString *)name andImageName:(NSString *)imageName andSelectable:(BOOL)selectable;

@end
