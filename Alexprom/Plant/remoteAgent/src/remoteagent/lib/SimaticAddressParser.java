package remoteagent.lib;

import org.libnodave.Nodave;

/**
 *
 * @author yura_
 */
public final class SimaticAddressParser {

    private int plcArea;
    
    private int dbNum;
    private int startAddress;
    private int byteCnt;
    private String address;
    
    public SimaticAddressParser(){
        
    }
    
    public SimaticAddressParser(String addressString){
        address = addressString;
        parseArea(addressString);
        if (plcArea==Nodave.DB){
            parseDbNum(addressString);
        }
        parseStartByte(addressString);
        int cnt = parseDataType(addressString);
        setByteCnt(cnt);
    }
    
    private void parseArea(String addressString){
        int area=-1;
        String areaSym = addressString.substring(0, 1);
        switch (areaSym){
            case "M": {
                area = Nodave.FLAGS;
                break;
            }
            case "I": {
                area = Nodave.INPUTS;
                break;
            }
            case "Q": {
                area = Nodave.OUTPUTS;
                break;
            }
            case "T": {
                area = Nodave.TIMER;
                break;
            }
            case "D": {
                area = Nodave.DB;
                break;
            }
            case "P": {
                area = Nodave.P;
                break;
            }
        }
        setPlcArea(area);
    }
    
    public void parseDbNum(String addressString){
        parseArea(addressString);
        if (plcArea==Nodave.DB){
            String s = addressString.substring(2);
            CharSequence ss = ".";
            for (int i=0; i<s.length(); i++){
                String dbNumber;
                if (s.charAt(i)==ss.toString().charAt(0)){
                    int index = i;
                    s = s.substring(0, index);
                    setDbNum(Integer.parseInt(s));
                    break;
                }
            }            
        }
    }
    
    public void parseInputArea(){
        
    }
    
    public int parseDataType(String addressString){
        int byteCount=0;
        if ((plcArea!=Nodave.TIMER) && (plcArea!=Nodave.COUNTER)){
            if (plcArea==Nodave.DB){
                String s = addressString.substring(2);
                CharSequence ss = ".";
                for (int i=0; i<s.length(); i++){
                    String dbNumber;
                    if (s.charAt(i)==ss.toString().charAt(0)){
                        int index = i;                    
                        s = s.substring(index+1, s.length());
                        int cutCnt;
                        while (s.length()>3){
                            s = s.substring(0, s.length()-1);
                        }
                        //setDbNum(Integer.parseInt(s));
                        switch (s){
                            case "DBB":{
                                byteCount = 1;
                                break;
                            }
                            case "DBW":{
                                byteCount = 2;
                                break;
                            }
                            case "DBD":{
                                byteCount = 4;
                                break;
                            }
                        } 
                        break;
                    }
                    
                }
                               
            }
            
        }
        return byteCount;
    }
    
    public void parseStartByte(String addressString){
        if (plcArea==Nodave.DB){
            String s = addressString.substring(2);
            CharSequence ss = ".";
            for (int i=0; i<s.length(); i++){
                String dbNumber;
                if (s.charAt(i)==ss.toString().charAt(0)){
                    int index = i;                    
                    s = s.substring(index+4, s.length());
                    setStartAddress(Integer.parseInt(s));
                    break;
                }
            }
            
        }
    }
    
    public int getPlcArea() {
        return plcArea;
    }

    public void setPlcArea(int area) {
        this.plcArea = area;
    }

    public int getDbNum() {
        return dbNum;
    }

    public void setDbNum(int dbNum) {
        this.dbNum = dbNum;
    }

    public int getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(int startAddress) {
        this.startAddress = startAddress;
    }

    public int getByteCnt() {
        return byteCnt;
    }

    public void setByteCnt(int byteCnt) {
        this.byteCnt = byteCnt;
    }
}
