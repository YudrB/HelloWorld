//
//  HelloWatch.m
//  HelloWorld Watch App
//
//  Created by Rudolph Balaz on 10/16/23.
//
#include "../Include/HelloLib.h"
#include "HelloWatch.h"

@implementation HelloWatch

HelloLib _h;

- (NSString*)getHelloWorld
{
  return [NSString stringWithUTF8String: _h.getHelloWorldString().c_str()];
}

@end
