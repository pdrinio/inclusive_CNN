// *****************************************************************************
// General settings for AddOn developments
// API Development Kit 14; Mac/Win
//
// Namespaces:		Contact person:
//		-None-
//
// [SG compatible] - Yes
// *****************************************************************************

#ifndef	_APIENVIR_H_
#define	_APIENVIR_H_


#if defined (_MSC_VER)
	#if !defined (WINDOWS)
		#define WINDOWS
	#endif
#endif

#if defined (WINDOWS)
	#include "Win32Interface.hpp"
	#pragma warning (disable: 4068)
#endif

#if defined (macintosh)
	#include	<MacTypes.h>
#endif

#if !defined (ACExtension)
	#define ACExtension
#endif


#endif
