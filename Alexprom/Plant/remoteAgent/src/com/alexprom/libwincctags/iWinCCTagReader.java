package com.alexprom.libwincctags;

import com.sun.jna.Native;
import com.sun.jna.win32.StdCallLibrary;

public interface iWinCCTagReader extends StdCallLibrary {

    iWinCCTagReader INSTANCE = (iWinCCTagReader) Native.loadLibrary("ODK_RW_Tags", iWinCCTagReader.class);
    iWinCCTagReader SYNC_INSTANCE = (iWinCCTagReader) Native.synchronizedLibrary(INSTANCE);

    Integer WinCC_Connect();
    void WinCC_Disconnect();

    void ReadTag_Text(String Tagname, String[] value);
    void WriteTag_Text(String Tagname, String[] value);

    boolean ReadTag_Boolean(String Tagname);

    double ReadTag_Real32(String Tagname);
    void WriteTag_Real(String Tagname, double value);

    int ReadeTag_Integer(String Tagname);
    void WriteTag_Integer(String Tagname, int value);

    int ProjectStatus();
}
