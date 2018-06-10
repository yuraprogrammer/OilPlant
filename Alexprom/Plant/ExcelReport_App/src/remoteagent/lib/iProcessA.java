package remoteagent.lib;

/**
 *
 * @author yura_
 */
public interface iProcessA {
    public void setValue(double val);
    public double getValue();
    public void setFault(boolean val);
    public boolean isFault();
}
