
//{{BLOCK(pauseBG)

//======================================================================
//
//	pauseBG, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 178 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 5696 + 2048 = 7776
//
//	Time-stamp: 2019-04-18, 23:42:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pauseBGTilesLen 5696
extern const unsigned short pauseBGTiles[2848];

#define pauseBGMapLen 2048
extern const unsigned short pauseBGMap[1024];

#define pauseBGPalLen 32
extern const unsigned short pauseBGPal[16];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pauseBG)
