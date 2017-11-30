package com.alexprom.libwincctags;

public class WinCCTags {
//    private OdcRwTags odkRwTags = OdcRwTags.INSTANCE;
    private final iWinCCTagReader winccRwTags = iWinCCTagReader.SYNC_INSTANCE;

    public Result connect() {
        Result result;
        int state =  winccRwTags.WinCC_Connect();
        switch (state) {
            case 0:
                result = Result.GOOD;
                break;
            case 1:
                result = Result.BAD;
                break;
            default:
                result = Result.BAD;
                break;
        }
        return result;
    }

    public void disconnect() {
        winccRwTags.WinCC_Disconnect();
    }

    public Result getState() {
        Result result;
        int state = winccRwTags.ProjectStatus();
        switch (state) {
            case 0:
                result = Result.GOOD;
                break;
            case 1:
                result = Result.BAD;
                break;
            default:
                result = Result.BAD;
                break;
        }
        return result;
    }

    public Result writeTagReal(String tagname, String value) {
        Result result = Result.GOOD;
        try {
            float f = Float.parseFloat(value);
            winccRwTags.WriteTag_Real(tagname, f);
        } catch (NumberFormatException e) {
            System.out.println("Не float" + e.getMessage());
            result = Result.BAD;
        }
        return result;
    }

    public Result writeTagInteger(String tagname, String value) {
        Result result = Result.GOOD;
        try {
            int i = Integer.parseInt(value);
            winccRwTags.WriteTag_Integer(tagname, i);
        } catch (NumberFormatException e) {
            System.out.println("Не float" + e.getMessage());
            result = Result.BAD;
        }
        return result;
    }

    public int readeTagInteger(String tagname) {
        return winccRwTags.ReadeTag_Integer(tagname);
    }

    public double readTagReal(String tagname) {
        return winccRwTags.ReadTag_Real32(tagname);
    }

    public int readTagBoolean(String tagname) {
        boolean b = false;
        try {
            b = winccRwTags.ReadTag_Boolean(tagname);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (b) return 1;
        else return 0;
    }

    public Result writeTagBoolean(String tagname, String value) {
        Result result = Result.GOOD;
        int val;
        try {
            val = Integer.parseInt(value);
            if ((val != 0) && (val != 1)) throw new NumberFormatException("Не boolean");
            winccRwTags.WriteTag_Integer(tagname, val);
        } catch (NumberFormatException e) {
            System.out.println("Не boolean" + e.getMessage());
            result = Result.BAD;
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return result;
    }

    public String readTagText(String tagname) {
        String[] s = new String[1];
        s[0] = "";
        try {
            winccRwTags.ReadTag_Text(tagname, s);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return s[0];
    }


}
