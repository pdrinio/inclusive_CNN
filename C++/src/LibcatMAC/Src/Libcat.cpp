/**
 * @file Contains the functions required by ArchiCAD.
 */

#include "Libcat.hpp"
#include "APIEnvir.h"
#include	<stdlib.h>
#include	<string.h>
#include	<stdio.h>
#if defined (macintosh)
	#include	<Quickdraw.h>
	#include	"DGUtility.hpp"
#endif
#if defined (WINDOWS)
	#include <CommDlg.h>
	#include <ShlObj.h>
#endif
#include	"DG.h"
#include	"UC.h"
#include	"ACAPinc.h"					
#include	"Array.hpp"
#include	"Location.hpp"
#include	"TreeEnumerator.hpp"
#include	"APICommon.h"
#include	"DGModule.hpp"
#include	"MDIDs_APICD.h"
#include	"HashTable.hpp"
#include	"NativeContexts.hpp"
#include	"GXImage.hpp"
#include	"GSRoot.hpp"


//DEFINE
#define	_DG_TEST_TRANSL_
#define	CURR_ADDON_VERS			0x0100		// The current version of the Add-On
#define Browser_GDLGID			32400		// The Browser dialog
#define Progress_GDLGID			32550		// The Progress window
#define MDID_DEVELOPER_ID	1
#define MDID_LOCAL_ID		1





//VARIABLES GLOBALES
short paletteDialId = 0;





//MANEJO DE LA BIBLIOTECA
#ifdef __APPLE__
#pragma mark -
#endif

// MANEJO DE LA LISTA EN LA PALETA
static void SetListView (short dialId, short lvItem, GSHandle ***gsh)
{
	API_LibPart		lp;
	Int32			nLibParts, nsh;
	short			one = 1;
	
	DGListViewSetHelpStyle (dialId, lvItem, DG_LVHS_FORITEM);
	
	// Speed up drawing
	DGListViewDisableDraw (dialId, lvItem);
	DGListViewDeleteItem (dialId, lvItem, DG_ALL_ITEMS);
	// Set the default sizes here
	DGListViewSetItemSize (dialId, lvItem, 60, 80);
	DGListViewSetImageSize (dialId, lvItem, 40, 40);
	
	ACAPI_LibPart_GetNum (&nLibParts);
	*gsh = (GSHandle **) BMhAllClear (nLibParts * sizeof (GSHandle));
	if (*gsh == NULL || BMError () != NoError)
		return;
	
	char	phaseText[] = "Filling list view...";
	ACAPI_Interface (APIIo_InitProcessWindowID, phaseText, &one);
	ACAPI_Interface (APIIo_SetNextProcessPhaseID, phaseText, &nLibParts);
	
	BNZeroMemory (&lp, sizeof (API_LibPart));
	// for all library parts
	for (lp.index = 1, nsh = 0; lp.index <= nLibParts; lp.index++) {
		ACAPI_Interface (APIIo_SetProcessValueID, &one, NULL);
		if (ACAPI_LibPart_Get (&lp) == NoError) {
			if (lp.location != NULL)
				delete lp.location;
			if (lp.typeID == APILib_ObjectID && !lp.isTemplate && lp.isPlaceable) {
				// it's an object
				
				API_LibPartSection	lpSect;
				API_MimePicture		mimePic;
				GSErrCode			err = NoError;
				
				// Get the preview picture
				BNZeroMemory (&lpSect, sizeof (API_LibPartSection));
				lpSect.sectType = API_SectInfoGIF;
				BNZeroMemory (&mimePic, sizeof (mimePic));
				err = ACAPI_LibPart_GetSection (lp.index, &lpSect, &mimePic.inputHdl, NULL);
				if (err == NoError) {
					mimePic.inContainsMime = true;
					mimePic.outDepth	   = (API_ColorDepthID) -1;
					mimePic.mimeOut		   = *mimePic.inputHdl;		// use the original mime type
					
					err = ACAPI_Goodies (APIAny_ConvertMimePictureID, (GSPtr) &mimePic, NULL);
				}
				if (err == NoError && mimePic.outputHdl != NULL) {
					char	docuname[256];
					CHTruncate (GS::UniString (lp.docu_UName).ToCStr (), docuname, sizeof (docuname));
					DGListViewInsertItem (dialId, lvItem, DG_LIST_BOTTOM);
					DGListViewSetItemText (dialId, lvItem, DG_LIST_BOTTOM, docuname);
					// Store the index of the library part as custom data for every item
					DGListViewSetItemUserData (dialId, lvItem, DG_LIST_BOTTOM, lp.index);
					
					const void* dgPicture = GX::Image (mimePic.outputHdl, FTM::UnknownType).ToDGPicture ().GetData ();
					DGListViewSetItemImage (dialId, lvItem, DG_LIST_BOTTOM, DG_LVIT_PICTURE, dgPicture);
					
					(**gsh)[nsh++] = (GS::GSHandle)dgPicture;
				}
				
				BMhKill (&mimePic.outputHdl);
				BMhKill (&mimePic.inputHdl);
			}
		}
		if (ACAPI_Interface (APIIo_IsProcessCanceledID, NULL, NULL) == APIERR_CANCEL)
			break;
	}
	
	ACAPI_Interface (APIIo_CloseProcessWindowID, NULL, NULL);
	
	DGListViewEnableDraw (dialId, lvItem);
	DGRedrawItem (dialId, lvItem);
	
	return;
}	

/////////////////////////////////////////////////////
// METODOS PARA MANEJO DE LA PALETA
/////////////////////////////////////////////////////
static void	Do_PaletteShowHide ()
{
	static	GSHandle	**gsh = NULL;
	
	if (paletteDialId > 0) {
		if (DGIsDialogOpen (paletteDialId)) {
			if (DGIsModelessDialogVisible (paletteDialId)) {
				DGHideModelessDialog (paletteDialId);
			} else {
				DGShowModelessDialog (paletteDialId, DG_DF_FIRST);
			}
		} else {
		}	
	} else {
	}
	
	
	return;
}

//MANEJADOR DE EVENTOS DE LA PALETA
static GSErrCode __ACENV_CALL	PaletteAPIControlCallBack (Int32 referenceID, API_PaletteMessageID messageID)
{
	if (referenceID == paletteDialId) {
		switch (messageID) {
			case APIPalMsg_ClosePalette:		DGModelessClose (paletteDialId);
				break;
				
			case APIPalMsg_HidePalette_Begin:
			case APIPalMsg_HidePalette_End:		Do_PaletteShowHide ();
				break;
				
			case APIPalMsg_DisableItems_Begin:	//if (!cntlDlgData.inMyInput)
				//EnablePaletteControls (false);
				//else
				//DisableInputControls ();
				break;
			case APIPalMsg_DisableItems_End:
				//EnablePaletteControls (true);
				break;
		}
	}
	
	return NoError;
}

//MANEJADOR DE EVENTOS PARA EL LANZAMIENTO DE LA PALETA
static short DGCALLBACK Browser_CB (short			message,
								    short			dialId,
				 			 	    short			item,
				  				    DGUserData		userData,
								    DGMessageData	msgData)
{
	short result = 0;
	
	static	GSHandle	**gsh = NULL;
	
#define	LV_SELECT	1
#define	LV_ITEM1	2
	
	
	
	
	
	switch (message) {
		case DG_MSG_INIT:
			DGSetItemValLong (dialId, LV_SELECT, 1);
			DGSetFocus (dialId, DG_NO_ITEM);
			
			if (ACAPI_RegisterModelessWindow (dialId, PaletteAPIControlCallBack,
											  API_PalEnabled_FloorPlan + API_PalEnabled_Section + API_PalEnabled_Elevation +
											  API_PalEnabled_InteriorElevation + API_PalEnabled_Detail + API_PalEnabled_Worksheet + API_PalEnabled_3D + API_PalEnabled_Layout) != NoError)
				DBPrintf ("Test:: ACAPI_RegisterModelessWindow failed\n");
			else 
				SetListView (dialId, LV_ITEM1, &gsh);

			break;
			
		case DG_MSG_ACTIVATE:
			break;
			
		case DG_MSG_UPDATE:
			break;
			
		case DG_MSG_CHANGE:
			if (item == LV_SELECT) {
				DGListViewDisableDraw (dialId, LV_ITEM1);
				switch (DGGetItemValLong (dialId, LV_SELECT)) {
					case 1:
						DGListViewSetViewMode (dialId, LV_ITEM1, DG_LVVM_BOTTOMTEXT);
						DGListViewSetItemSize (dialId, LV_ITEM1, 60, 80);
						DGListViewSetImageSize (dialId, LV_ITEM1, 40, 40);
						break;
						
					case 2:
						DGListViewSetViewMode (dialId, LV_ITEM1, DG_LVVM_BOTTOMTEXT);
						DGListViewSetItemSize (dialId, LV_ITEM1, 36, 36);
						DGListViewSetImageSize (dialId, LV_ITEM1, 16, 16);
						break;
						
					default:
						DGListViewSetViewMode (dialId, LV_ITEM1, DG_LVVM_SINGLECOLUMN);
						DGListViewSetItemSize (dialId, LV_ITEM1, 0, 18);
						DGListViewSetImageSize (dialId, LV_ITEM1, 16, 16);
						break;
				}
				DGListViewEnableDraw (dialId, LV_ITEM1);
				DGRedrawItem (dialId, LV_ITEM1);
			}
			break;
			
		case DG_MSG_CLICK:
			switch (item) {
				case DG_CLOSEBOX:
					return item;			// this will result in a DG_MSG_CLOSE message
			}
			break;
			
		case DG_MSG_DOUBLECLICK:
			break;
			
		case DG_MSG_GROW: {
			short	vgrow = DGGetVGrow (msgData);
			short	hgrow = DGGetHGrow (msgData);
			DGBeginMoveGrowItems (dialId);
			DGMoveItem (dialId, DG_OK, hgrow, vgrow);
			DGGrowItem (dialId, LV_ITEM1, hgrow, vgrow);
			DGEndMoveGrowItems (dialId);
		}
			break;
			
		case DG_MSG_CLOSE:
			if (item == DG_OK) {
				Int32 sel = DGListViewGetSelected (dialId, LV_ITEM1, DG_LIST_TOP);
				if (sel != 0)
					*((Int32 *) userData) = TruncateTo32Bit (DGListViewGetItemUserData (dialId, LV_ITEM1, (short) sel));
				
				Int32 nsh = BMhGetSize ((GSHandle) gsh) / Sizeof32 (GSHandle);
				for (Int32 ii = 0; ii < nsh && (*gsh)[ii] != NULL; ii++) {
#if defined (WINDOWS)
					BMhKill (&(*gsh)[ii]);
#else
					KillPicture ((PicHandle) (*gsh)[ii]);
#endif
				}
				BMhKill ((GSHandle *) &gsh);
			}
			
			ACAPI_UnregisterModelessWindow (dialId);
			paletteDialId = 0;
			break;
	}
	
	return (0);
	
#undef LV_SELECT
#undef LV_ITEM1
}

static GSErrCode	Do_PaletteInit (void)
{
	GSErrCode		err;
	Int32		chosenInd = 0;
	
	err = NoError;
	
	if (paletteDialId == 0 || !DGIsDialogOpen (paletteDialId)) {
		GSResModule actResModule = ACAPI_UseOwnResModule ();
		
		paletteDialId = DGModelessInit (32400, Browser_CB, (DGUserData) &chosenInd, 1);
		
		ACAPI_ResetResModule (actResModule);
	}
	
	if (paletteDialId == 0)
		err = APIERR_GENERAL;
	
	return err;
}

static void		Do_PaletteClose (void)
{
	if (paletteDialId != 0 && DGIsDialogOpen (paletteDialId))
		DGModelessClose (paletteDialId);
	
	paletteDialId = 0;
	
	return;
}

static void		Do_LibraryBrowser (void)
{
	Int32		chosenInd = 0;
	GSResModule	filNum;
	bool		isOK;

	filNum = ACAPI_UseOwnResModule ();		// Set own resource file the active one
	//isOK = (DGModalDialog (Browser_GDLGID, Browser_CB, (DGUserData) &chosenInd) == DG_OK);
	paletteDialId = DGModelessInit(Browser_GDLGID, Browser_CB, (DGUserData) &chosenInd,0);
	//DGShowModelessDialog(paletteDialId, DG_DF_FIRST);
	//DGActivateModelessDialog(paletteDialId);
	
	
	//isOK = (DGModalDialog (Browser_GDLGID, Browser_CB, (DGUserData) &chosenInd) == DG_OK);
	
	ACAPI_ResetResModule (filNum);

	//if (isOK) {
		//if (chosenInd == 0)
			//WriteReport ("You didn't select anything.");
		//else
			//WriteReport ("Library index of the selected window: %d", chosenInd);
	//}

	return;
}		// Do_LibraryBrowser

#ifdef __APPLE__
#pragma mark -
#endif



// -----------------------------------------------------------------------------
// Modal progress dialog
// -----------------------------------------------------------------------------
struct CBData;

typedef GSErrCode	__ACENV_CALL	LibPartPlacerProc (CBData *cbd);

typedef struct CBData {
	Int32				cnt;
	Int32				numLPs;
	Int32				goodLPs;
	double				xPos;
	API_Element			defElem;
	LibPartPlacerProc	*proc;
#ifdef WINDOWS
	HCURSOR				hCursor;
#endif
} CBData;



// -----------------------------------------------------------------------------
// Progress dialog handler (internal callback)
// -----------------------------------------------------------------------------

static GSErrCode	__ACENV_CALL	LibPartPlacer (CBData *cbd)

{
	double				aa = 0, bb = 0;
	Int32				addParNum;
	API_Element			elem;
	API_ElementMemo		memo;
	GSErrCode			err = Error;
	
	BNZeroMemory (&elem, sizeof (elem));
	BNZeroMemory (&memo, sizeof (memo));
	if (ACAPI_LibPart_GetParams (cbd->cnt, &aa, &bb, &addParNum, &memo.params) == NoError) {
		elem = cbd->defElem;
		elem.object.libInd = cbd->cnt;
		elem.object.pos.x  = cbd->xPos;
		elem.object.pos.y  = 0;
		elem.object.xRatio = aa;
		elem.object.yRatio = bb;
		if (ACAPI_Element_Create (&elem, &memo) == NoError) {
			cbd->xPos += aa + 0.2;
			err = NoError;
		}
	}
	ACAPI_DisposeElemMemoHdls (&memo);
	
	return err;
	
}	// LibPartPlacer



// -----------------------------------------------------------------------------
// Progress dialog handler (callback)
// -----------------------------------------------------------------------------

static short DGCALLBACK Progress_Handler (short				message,
										  short				dialogID,
										  short				item,
										  DGUserData		userData,
										  DGMessageData		/*msgData*/)
{
// Dialog item IDs
#define CancelBtn		1
#define ProcTextItm		2

	short	result = 0;
	CBData	*cbd = (CBData *) userData;

	if (cbd == NULL)
		return result;


	switch (message) {
		case DG_MSG_INIT:
			DGEnableMessage (dialogID, DG_ALL_ITEMS, DG_MSG_NULL);
			break;

		case DG_MSG_NULL:
			if (cbd->cnt < cbd->numLPs) {
				++cbd->cnt;
				if ((cbd->cnt % 20) == 0) {
					char	progText[128];

					sprintf (progText, "Placed %ld libparts", cbd->cnt);
					DGSetItemText (dialogID, ProcTextItm, progText);
				}

#ifdef WINDOWS
				if (cbd->cnt > 20) {
					if (cbd->hCursor == NULL)
						cbd->hCursor = SetCursor (LoadCursor (NULL, IDC_WAIT));
					else
						SetCursor (LoadCursor (NULL, IDC_WAIT));
				}
#endif

				if (cbd->proc != NULL && (*cbd->proc) (cbd) == NoError)
					++cbd->goodLPs;

			} else {
				result = 1;
			}
			break;

		case DG_MSG_CLICK:
			switch (item) {
			case CancelBtn:
			case DG_CLOSEBOX:
				result = item;
				break;
			}
			break;

		case DG_MSG_CLOSE:
#ifdef WINDOWS
			if (cbd->hCursor)
				SetCursor (cbd->hCursor);
#endif
			result = item;
			break;
		}

	return (result);

#undef ProcTextItm
#undef CancelBtn
}		// Progress_Handler




// -----------------------------------------------------------------------------
// A simple progress window implementation
// -----------------------------------------------------------------------------
static void		Do_ProgressWindow (void)
{
	GSResModule	filNum;
	CBData		cbd;
	char		progText[128];

	BNZeroMemory (&cbd, sizeof (CBData));
	cbd.defElem.header.typeID = API_ObjectID;
	if (ACAPI_Element_GetDefaults (&cbd.defElem, NULL) != NoError)
		return;
	if (ACAPI_LibPart_GetNum (&cbd.numLPs) != NoError || cbd.numLPs == 0)
		return;
	cbd.proc = LibPartPlacer;

	if (ACAPI_OpenUndoableSession ("Place library parts") != NoError)
		return;

	// Get the dialog from our resource file
	filNum = ACAPI_UseOwnResModule ();
	DGModalDialog (Progress_GDLGID, Progress_Handler, (DGUserData) &cbd);
	ACAPI_ResetResModule (filNum);

	ACAPI_CloseUndoableSession ();

	if (cbd.goodLPs > 0) {
		sprintf (progText, "Colocado%s %ld elemento%s de libreria", cbd.goodLPs > 1 ? "s" : " ", cbd.goodLPs, cbd.goodLPs > 1 ? "s" : " ");
		DGAlert (DG_INFORMATION, "Informe de progreso", progText, NULL, "OK", NULL, NULL);
	}

	return;
}		// Do_ProgressWindow









static void Do_CountElements (void)
{
	GS::Array<API_Guid> elemList;
	ACAPI_Element_GetElemList (API_ObjectID, &elemList);
	DBPrintf ("\t(number of lines = %ld,", elemList.GetSize ());

	short totalCount = 0;
	char message[10000];
	BNZeroMemory (message, sizeof (message));

	for (GS::Array<API_Guid>::ConstIterator it = elemList.Enumerate (); it != NULL; ++it) {
		API_Element element;
		API_ElementMemo memo;
		API_LibPart libPart;
		BNZeroMemory (&element, sizeof (API_Element));
		BNZeroMemory (&memo , sizeof (API_ElementMemo));
		BNZeroMemory (&libPart , sizeof (API_LibPart));
		//element.header.guid = elemList[it.GetIndex()];
		element.header.guid = *it;
		if (ACAPI_Element_Get (&element) == NoError) {
			if (ACAPI_Element_GetMemo (element.header.guid, &memo, APIMemoMask_All) == NoError) {
				libPart.index = element.object.libInd; 

				if (ACAPI_LibPart_Get (&libPart) == NoError) {
					++totalCount;

					char docuname[256];
					CHTruncate (GS::UniString (libPart.docu_UName).ToCStr (), docuname, sizeof (docuname));
					strcat(message, docuname );
					strcat(message,"\n");
				}
			}
		}
	}

	FILE * pFile;
	pFile = fopen ("Archicad.txt","w");
	if (pFile!=NULL)
	{
		fputs (message,pFile);
		fclose (pFile);
		DGAlert (DG_INFORMATION, "Informacion", "El recuento de bloque ha finalizado. Vea el archivo \"C:\\Archicad.txt\"", NULL, "OK", NULL, NULL);
	} else {
		DGAlert (DG_INFORMATION, "Error", "No se ha podidio escribir el fichero de resultados", NULL, "OK", NULL, NULL);
	}
}

static void Do_CountElements_ByElement (void)
{
	GS::Array<API_Guid> elemList;
	ACAPI_Element_GetElemList (API_ObjectID, &elemList);
	DBPrintf ("\t(number of lines = %ld,", elemList.GetSize ());

	short totalCount = 0;
	char message[10000];
	BNZeroMemory (message, sizeof (message));

	GS::HashTable<GS::UniString , short> *table;
	table = new GS::HashTable<GS::UniString , short>();

	for (GS::Array<API_Guid>::ConstIterator it = elemList.Enumerate (); it != NULL; ++it) {
		API_Element element;
		API_ElementMemo memo;
		API_LibPart libPart;
		BNZeroMemory (&element, sizeof (API_Element));
		BNZeroMemory (&memo , sizeof (API_ElementMemo));
		BNZeroMemory (&libPart , sizeof (API_LibPart));
		//element.header.guid = elemList[it.GetIndex()];
		element.header.guid = *it;
		if (ACAPI_Element_Get (&element) == NoError) {
			if (ACAPI_Element_GetMemo (element.header.guid, &memo, APIMemoMask_All) == NoError) {
				libPart.index = element.object.libInd; 

				if (ACAPI_LibPart_Get (&libPart) == NoError) {
					++totalCount;

					if (table->ContainsKey (GS::UniString (libPart.docu_UName))) {
						table->Set(GS::UniString (libPart.docu_UName), table->Get(GS::UniString (libPart.docu_UName)) + 1);
					} else {
						//table.Get (libPart.docu_UName);
						table->Put(GS::UniString (libPart.docu_UName),1);
					}
				}
			}
		}
	}


	for (GS::HashTable<GS::UniString,short>::PairIterator it = table->EnumeratePairs(); it != NULL; ++it) {
		char docuname[256];
		const GS::UniString *tmpK = it->key;
		const short *tmpV = it->value;
		char cont[10];
		sprintf (cont, "%d", *tmpV);

		CHTruncate (tmpK->ToCStr (), docuname, sizeof (docuname));
		strcat(message , cont);
		strcat(message , ";");
		strcat(message, docuname );
		strcat(message , ";");
		strcat(message,"\n");
	}

	FILE * pFile;
	pFile = fopen ("Archicad_porElemento.txt","w");
	if (pFile!=NULL)
	{
		fputs (message,pFile);
		fclose (pFile);
		DGAlert (DG_INFORMATION, "Informacion", "El recuento de bloque ha finalizado. Vea el archivo \"C:\\Archicad_porElemento.txt\"", NULL, "OK", NULL, NULL);
	} else {
		DGAlert (DG_INFORMATION, "Error", "No se ha podidio escribir el fichero de resultados", NULL, "OK", NULL, NULL);
	}
}

static void Do_CountElements_ByElement_ByLayer (void)
{
	GS::Array<API_Guid> elemList;
	ACAPI_Element_GetElemList (API_ObjectID, &elemList);
	DBPrintf ("\t(number of lines = %ld,", elemList.GetSize ());

	short totalCount = 0;
	char message[10000];
	BNZeroMemory (message, sizeof (message));

	GS::HashTable<GS::UniString , short> *table;
	table = new GS::HashTable<GS::UniString , short>();

	for (GS::Array<API_Guid>::ConstIterator it = elemList.Enumerate (); it != NULL; ++it) {
		API_Element element;
		API_ElementMemo memo;
		API_LibPart libPart;
		API_Attribute att;		
		BNZeroMemory (&element, sizeof (API_Element));
		BNZeroMemory (&memo , sizeof (API_ElementMemo));
		BNZeroMemory (&libPart , sizeof (API_LibPart));
		BNZeroMemory (&att, sizeof (API_Attribute));
		//element.header.guid = elemList[it.GetIndex()];
		element.header.guid = *it;
		if (ACAPI_Element_Get (&element) == NoError) {
			if (ACAPI_Element_GetMemo (element.header.guid, &memo, APIMemoMask_All) == NoError) {

				if (element.header.layer != 0) {
					att.header.typeID = API_LayerID;
					att.header.index = element.header.layer;

					/*err = ACAPI_Element_GetDefaults (&element, NULL);
					if (err != NoError) {
					ErrorBeep ("ACAPI_Element_GetDefaults", err);
					return;
					}*/

					if (ACAPI_Attribute_Get (&att) == NoError) {
						libPart.index = element.object.libInd; 

						if (ACAPI_LibPart_Get (&libPart) == NoError) {
							++totalCount;

							char key[512];
							char key1[256];
							BNZeroMemory (key, sizeof (key));
							BNZeroMemory (key1, sizeof (key1));
							CHTruncate (GS::UniString (libPart.docu_UName).ToCStr (), key1, sizeof (key1));

							strcat(key , att.header.name);
							strcat(key , ";");
							strcat(key , key1);
							

							if (table->ContainsKey (GS::UniString (key))) {
								table->Set(GS::UniString (key), table->Get(GS::UniString (key)) + 1);
							} else {
								table->Put(GS::UniString (key),1);
							}
						}
					} 
				}
			}
		}
	}


	for (GS::HashTable<GS::UniString,short>::PairIterator it = table->EnumeratePairs(); it != NULL; ++it) {
		char docuname[512];
		const GS::UniString *tmpK = it->key;
		const short *tmpV = it->value;
		char cont[10];
		sprintf (cont, "%d", *tmpV);

		CHTruncate (tmpK->ToCStr (), docuname, sizeof (docuname));
		strcat(message , cont);
		strcat(message , ";");
		strcat(message, docuname );
		strcat(message , ";");
		strcat(message,"\n");
	}

	FILE * pFile;
	pFile = fopen ("Archicad_porElemento_porCapa.txt","w");
	if (pFile!=NULL)
	{
		fputs (message,pFile);
		fclose (pFile);
		DGAlert (DG_INFORMATION, "Informacion", "El recuento de bloque ha finalizado. Vea el archivo \"C:\\Archicad_porElemento_porCapa.txt\"", NULL, "OK", NULL, NULL);
	} else {
		DGAlert (DG_INFORMATION, "Error", "No se ha podidio escribir el fichero de resultados", NULL, "OK", NULL, NULL);
	}

}















/**
 * Dependency definitions. Function name is fixed.
 *
 * @param envir [in] ArchiCAD environment values.
 * @return The Add-On loading type.
 */
API_AddonType	__ACENV_CALL	CheckEnvironment (API_EnvirParams* envir)
{
	GSResModule saveResModule = ACAPI_UseOwnResModule ();
	ACAPI_Resource_GetLocStr (envir->addOnInfo.name, 32000, 1);
	ACAPI_Resource_GetLocStr (envir->addOnInfo.description, 32000, 2);
	ACAPI_ResetResModule (saveResModule);

	return APIAddon_Normal;
}		// CheckEnvironment ()

/**
 * Interface definitions. Function name is fixed.
 *
 * @return ArchiCAD error code.
 */
GSErrCode	__ACENV_CALL	RegisterInterface (void)
{
	//
	// Register a menu
	//
	GSErrCode err = ACAPI_Register_Menu (32500, 32510, MenuCode_UserDef, MenuFlag_Default);
	return err;
}		// RegisterInterface ()

/**
 * Menu command handler function. Function name is NOT fixed. There can be
 * more than one of these functions. Please check the API Development Kit
 * documentation for more information.
 *
 * @param params [in] Parameters of the menu command.
 * @return ArchiCAD error code.
 */
GSErrCode __ACENV_CALL	CommandHandler (const API_MenuParams * params)
{
	switch (params->menuItemRef.menuResID) {
		case 32500:
			switch (params->menuItemRef.itemIndex) {
				case 1:		if (paletteDialId == 0)
								Do_PaletteInit ();
							else
								Do_PaletteClose ();
							break;
				case 2:		Do_ProgressWindow ();		break;
				case 3:		Do_CountElements ();		break;
				case 4:		Do_CountElements_ByElement ();		break;
				case 5:		Do_CountElements_ByElement_ByLayer ();		break;

			}
			break;
	}
	return NoError;
}		// CommandHandler ()

/**
 * Called after the Add-On has been loaded into memory. Function name is fixed.
 *
 * @return ArchiCAD error code.
 */
GSErrCode __ACENV_CALL	Initialize (void)
{
	GSErrCode err = ACAPI_Install_MenuHandler (32500, CommandHandler);

	// register special help location if needed
	// for Graphisoft's add-ons, this is the Help folder beside the installed ArchiCAD
	IO::Location		helpLoc;
	API_SpecFolderID	specID = API_HelpFolderID;

	ACAPI_Environment (APIEnv_GetSpecFolderID, &specID, (void*) &helpLoc);
	DG::RegisterAdditionalHelpLocation (MDID_DEVELOPER_ID, MDID_LOCAL_ID, helpLoc);

	return err;
}		// Initialize ()

/**
 * Called when the Add-On is going to be unloaded. Function name is fixed.
 *
 * @return ArchiCAD error code.
 */
GSErrCode __ACENV_CALL	FreeData (void)

{
	DG::UnregisterAdditionalHelpLocation (MDID_DEVELOPER_ID, MDID_LOCAL_ID);

	return NoError;
}		// FreeData ()
