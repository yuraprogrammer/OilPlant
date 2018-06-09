package remoteagent.lib;

/**
 *
 * @author yura_
 */
public class PlcTag {
    private String tagName = "NewTag";
    private String plcName = "PLC_1";
    private String S7Addr = "DB1.DBB0";
    private double minValue = 0.0;
    private double maxValue = 100000.0;
    private ProcessA currentValue;
    
    public PlcTag(){
        
    }
    
    public PlcTag(String tagName, String plcName, String S7Addr){
        setTagName(tagName);
        setPlcName(plcName);
        setS7Addr(S7Addr);
    }            
    
    public String getTagName() {
        return tagName;
    }

    public final void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getPlcName() {
        return plcName;
    }

    public final void setPlcName(String plcName) {
        this.plcName = plcName;
    }

    public String getS7Addr() {
        return S7Addr;
    }

    public final void setS7Addr(String S7Addr) {
        this.S7Addr = S7Addr;
    }

    public double getMinValue() {
        return minValue;
    }

    public void setMinValue(double minValue) {
        this.minValue = minValue;
    }

    public double getMaxValue() {
        return maxValue;
    }

    public void setMaxValue(double maxValue) {
        this.maxValue = maxValue;
    }    

    public ProcessA getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(ProcessA currentValue) {
        this.currentValue = currentValue;
    }
    
}
