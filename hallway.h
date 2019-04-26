
//{{BLOCK(hallway)

//======================================================================
//
//	hallway, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 171 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10944 + 2048 = 13504
//
//	Time-stamp: 2019-04-25, 22:25:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HALLWAY_H
#define GRIT_HALLWAY_H

#define hallwayTilesLen 10944
extern const unsigned short hallwayTiles[5472];

#define hallwayMapLen 2048
extern const unsigned short hallwayMap[1024];

#define hallwayPalLen 512
extern const unsigned short hallwayPal[256];

#endif // GRIT_HALLWAY_H

//}}BLOCK(hallway)
