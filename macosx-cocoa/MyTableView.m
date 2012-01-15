#import "MyTableView.h"
#import "StarfishController.h"
#import "StarfishControllerPrivate.h"

@implementation MyTableView

#if 0
- (void) mouseDown:(NSEvent*)event
{
	[super mouseDown:event];

	int		index = [gMainController indexOfSelectedRecentPict];

	if (index >= 0 && ![gMainController isGenerating]) {
		NSString	*path  = [gMainController recentPathAtIndex:index];
		NSImage		*image = [gMainController recentImageAtIndex:index];
		NSImage		*thumb = [gMainController recentThumbnailAtIndex:index];
		NSRect		r = [self bounds];
//		[self dragFile:path fromRect:r slideBack:YES event:event];

		NSSize			offset = NSMakeSize(0.0, 0.0);
		NSPasteboard	*pboard = [NSPasteboard pasteboardWithName:NSDragPboard];
		NSArray			*types = [NSArray arrayWithObjects:NSURLPboardType, NSTIFFPboardType, nil];
		[pboard declareTypes:types owner:self]; 
		[[NSURL fileURLWithPath:path] writeToPasteboard:pboard];
		[pboard setData:[image TIFFRepresentation] forType:NSTIFFPboardType];

		offset.height = [event locationInWindow].y;
		offset.width  = [event locationInWindow].x;
 		[self dragImage:thumb at:r.origin offset:offset event:event pasteboard:pboard source:self slideBack:YES];
	} else
        AudioServicesPlayAlertSound(kSystemSoundID_UserPreferredAlert);
} // mouseDown:
#endif
// -----

- (unsigned int) draggingSourceOperationMaskForLocal:(BOOL)isLocal
{
	return (NSDragOperationCopy | NSDragOperationLink);
} // draggingSourceOperationMaskForLocal:


@end
