
//{{BLOCK(winBG)

//======================================================================
//
//	winBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 131 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4192 + 2048 = 6752
//
//	Time-stamp: 2019-04-18, 23:31:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINBG_H
#define GRIT_WINBG_H

#define winBGTilesLen 4192
extern const unsigned short winBGTiles[2096];

#define winBGMapLen 2048
extern const unsigned short winBGMap[1024];

#define winBGPalLen 512
extern const unsigned short winBGPal[256];

#endif // GRIT_WINBG_H

//}}BLOCK(winBG)
