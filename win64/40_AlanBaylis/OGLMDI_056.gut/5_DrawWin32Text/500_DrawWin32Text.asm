void DrawWin32Text(HDC hDC, int right, int bottom, int x, int y)
{
    colorRGB = RGB(255, 255, 255);
    SetTextColor(hDC, colorRGB);              // Sets the text color
    SetBkMode(hDC, TRANSPARENT);              // Sets the text background to transparent
    MainRect.left = 0;                        // Set the whole screen as the drawing area
    MainRect.top = 0;
    MainRect.bottom = bottom;
    MainRect.right = right;
    ZeroMemory(&LogFont, sizeof(LogFont));
    LogFont.lfHeight = 14;                    // Font height
    LogFont.lfWidth = 8;                   // Font width
    LogFont.lfEscapement = 0;              // Text rotation for true type fonts. If this one is set then also set the next line to the same value
    LogFont.lfOrientation = 0;
    LogFont.lfWeight = FW_NORMAL;
    LogFont.lfItalic = 0;
    LogFont.lfUnderline = 0;
    LogFont.lfStrikeOut = 0;
    LogFont.lfCharSet = DEFAULT_CHARSET;
    LogFont.lfOutPrecision = OUT_DEFAULT_PRECIS;
    LogFont.lfClipPrecision = CLIP_DEFAULT_PRECIS;
    LogFont.lfQuality = DEFAULT_QUALITY;
    LogFont.lfPitchAndFamily = DEFAULT_PITCH;
    sprintf(LogFont.lfFaceName, "%s", "Arial");
    hFont = CreateFontIndirect(&LogFont);
    SaveDC(hDC);
    hOldFont = (HFONT)SelectObject(hDC, (HFONT)hFont);
    char tempstring[20];
    sprintf(tempstring, "%d", MouseX);
    DrawText(hDC, tempstring, 11, &MainRect, DT_NOCLIP | DT_LEFT | DT_BOTTOM | DT_WORDBREAK | DT_EDITCONTROL);
    SelectObject(hDC, (HFONT)hOldFont);
    DeleteObject(hFont);
    RestoreDC(hDC, -1);
}
