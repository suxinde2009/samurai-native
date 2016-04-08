//
//     ____    _                        __     _      _____
//    / ___\  /_\     /\/\    /\ /\    /__\   /_\     \_   \
//    \ \    //_\\   /    \  / / \ \  / \//  //_\\     / /\/
//  /\_\ \  /  _  \ / /\/\ \ \ \_/ / / _  \ /  _  \ /\/ /_
//  \____/  \_/ \_/ \/    \/  \___/  \/ \_/ \_/ \_/ \____/
//
//	Copyright Samurai development team and other contributors
//
//	http://www.samurai-framework.com
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.
//

#import "Samurai_UIToolbar.h"

#import "_pragma_push.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "Samurai_Metric.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation SamuraiUIToolbarAgent
{
	BOOL _enabled;
}

@def_prop_unsafe( UIToolbar *,	toolbar );

- (void)dealloc
{
	[self disableEvents];
}

- (void)enableEvents
{
	if ( NO == _enabled )
	{
		TODO( "enable event" )
		
		_enabled = YES;
	}
}

- (void)disableEvents
{
	if ( _enabled )
	{
		TODO( "disable events" )
		
		_enabled = NO;
	}
}

@end

#pragma mark -

@implementation UIToolbar(Samurai)

//@def_signal( eventValueChanged )

+ (id)createInstanceWithRenderer:(SamuraiRenderObject *)renderer identifier:(NSString *)identifier
{
	UIToolbar * toolbar = [[self alloc] initWithFrame:CGRectZero];
	
	toolbar.renderer = renderer;
	
	[[toolbar toolbarAgent] enableEvents];

	return toolbar;
}

#pragma mark -

- (SamuraiUIToolbarAgent *)toolbarAgent
{
	SamuraiUIToolbarAgent * agent = [self getAssociatedObjectForKey:"UIToolbar.agent"];
	
	if ( nil == agent )
	{
		agent = [[SamuraiUIToolbarAgent alloc] init];
		agent.toolbar = self;

		[self retainAssociatedObject:agent forKey:"UIToolbar.agent"];
	}
	
	return agent;
}

#pragma mark -

+ (BOOL)supportTapGesture
{
	return YES;
}

+ (BOOL)supportSwipeGesture
{
	return YES;
}

+ (BOOL)supportPinchGesture
{
	return YES;
}

+ (BOOL)supportPanGesture
{
	return YES;
}

#pragma mark -

- (id)serialize
{
	TODO( "serialize" )
	
	return nil;
}

- (void)unserialize:(id)obj
{
	TODO( "unserlize" )
}

- (void)zerolize
{
	TODO( "zerolize" )
}

#pragma mark -

- (void)applyDom:(SamuraiDomNode *)dom
{
	[super applyDom:dom];
}

- (void)applyStyle:(SamuraiRenderStyle *)style
{
	[super applyStyle:style];
}

- (void)applyFrame:(CGRect)frame
{
	[super applyFrame:frame];
}

#pragma mark -

- (CGSize)computeSizeBySize:(CGSize)size
{
	return [super computeSizeBySize:size];
}

- (CGSize)computeSizeByWidth:(CGFloat)width
{
	return [super computeSizeByWidth:width];
}

- (CGSize)computeSizeByHeight:(CGFloat)height
{
	return [super computeSizeByHeight:height];
}

@end

// ----------------------------------
// Unit test
// ----------------------------------

#pragma mark -

#if __SAMURAI_TESTING__

TEST_CASE( UI, UIToolbar )

DESCRIBE( before )
{
}

DESCRIBE( after )
{
}

TEST_CASE_END

#endif	// #if __SAMURAI_TESTING__

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "_pragma_pop.h"
