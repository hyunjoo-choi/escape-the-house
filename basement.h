
//{{BLOCK(basement)

//======================================================================
//
//	basement, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 564 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 36096 + 2048 = 38656
//
//	Time-stamp: 2019-04-25, 21:41:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BASEMENT_H
#define GRIT_BASEMENT_H

#define basementTilesLen 36096
extern const unsigned short basementTiles[18048];

#define basementMapLen 2048
extern const unsigned short basementMap[1024];

#define basementPalLen 512
extern const unsigned short basementPal[256];

#endif // GRIT_BASEMENT_H

//}}BLOCK(basement)
