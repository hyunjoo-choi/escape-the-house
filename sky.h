
//{{BLOCK(sky)

//======================================================================
//
//	sky, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 241 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15424 + 2048 = 17984
//
//	Time-stamp: 2019-04-24, 17:32:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKY_H
#define GRIT_SKY_H

#define skyTilesLen 15424
extern const unsigned short skyTiles[7712];

#define skyMapLen 2048
extern const unsigned short skyMap[1024];

#define skyPalLen 512
extern const unsigned short skyPal[256];

#endif // GRIT_SKY_H

//}}BLOCK(sky)
