//
//  KCSBeaconInfo.m
//  KCSIBeacon
//
//  Copyright 2014 Kinvey, Inc
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
#import "KCSBeaconInfo.h"

@implementation CLBeaconRegion (KCSBeaconInfo)

- (KCSBeaconInfo *)kcsBeaconInfo
{
    KCSBeaconInfo* beaconInfo = [[KCSBeaconInfo alloc] init];
    beaconInfo.uuid = [self.proximityUUID UUIDString];
    beaconInfo.major = [self.major unsignedIntValue];
    beaconInfo.minor = [self.minor unsignedIntValue];
    return beaconInfo;
}

@end

@implementation KCSBeaconInfo

- (BOOL)isEqual:(KCSBeaconInfo*)object
{
    return [object isKindOfClass:[KCSBeaconInfo class]] &&
           [object.uuid isEqualToString:self.uuid] &&
           object.major == self.major &&
           object.minor == self.minor;
}

- (NSUInteger)hash
{
    return [self.uuid hash] + self.minor + self.major;
}

@end
