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

#import "Samurai_HtmlRenderViewport.h"

#import "_pragma_push.h"

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "Samurai_HtmlLayoutViewport.h"
#import "Samurai_HtmlElementViewport.h"

#import "Samurai_HtmlRenderStoreScope.h"
#import "Samurai_HtmlRenderStore.h"

// ----------------------------------
// Source code
// ----------------------------------

#pragma mark -

@implementation SamuraiHtmlRenderViewport

+ (Class)defaultLayoutClass
{
	return [SamuraiHtmlLayoutViewport class];
}

+ (Class)defaultViewClass
{
	return [SamuraiHtmlElementViewport class];
}

#pragma mark -

- (UIView *)createViewWithIdentifier:(NSString *)identifier
{
	return [super createViewWithIdentifier:identifier];
}

#pragma mark -

- (void)renderWillLoad
{
	[super renderWillLoad];
}

- (void)renderDidLoad
{
	[super renderDidLoad];
}

#pragma mark -

- (void)computeProperties
{
	[super computeProperties];
	
	if ( nil == self.layout )
	{
		self.layout = [SamuraiHtmlLayoutViewport layout:self];
	}
}

#pragma mark -

- (void)html_applyDom:(SamuraiHtmlDomNode *)dom
{
	[super html_applyDom:dom];
}

- (void)html_applyStyle:(SamuraiHtmlRenderStyle *)style
{
	[super html_applyStyle:style];
}

- (void)html_applyFrame:(CGRect)newFrame
{
	[super html_applyFrame:newFrame];
}

- (void)html_forView:(UIView *)hostView
{
	[super html_forView:hostView];
}

#pragma mark -

- (BOOL)store_hasChildren
{
	return YES;
}

- (id)store_serialize
{
	return [[self.childs firstObject] store_serialize];
}

- (void)store_unserialize:(id)obj
{
	[[self.childs firstObject] store_unserialize:obj];
}

- (void)store_zerolize
{
	[[self.childs firstObject] store_zerolize];
}

@end

// ----------------------------------
// Unit test
// ----------------------------------

#pragma mark -

#if __SAMURAI_TESTING__

TEST_CASE( WebCore, HtmlRenderViewport )

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
