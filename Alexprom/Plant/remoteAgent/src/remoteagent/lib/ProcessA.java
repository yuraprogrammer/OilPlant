/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package remoteagent.lib;

/**
 *
 * @author yura_
 */
public class ProcessA implements iProcessA{
    private double value;
    private boolean fault;
    
    @Override
    public void setValue(double val) {
        value = val;
    }

    @Override
    public double getValue() {
        return value;
    }

    @Override
    public void setFault(boolean val) {
        fault = val;
    }

    @Override
    public boolean isFault() {
        return fault;
    }
    
}
