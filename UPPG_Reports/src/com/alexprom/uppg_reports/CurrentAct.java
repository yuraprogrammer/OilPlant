package com.alexprom.uppg_reports;


import com.alexprom.entities.process.ActUPPG;
import org.openide.nodes.AbstractNode;
import org.openide.nodes.Children;
import org.openide.nodes.Sheet;
import org.openide.util.lookup.Lookups;

public class CurrentAct extends AbstractNode{
    
    public CurrentAct(ActUPPG act) {
        super(Children.LEAF, Lookups.singleton(act));        
    }    
    
    @Override
    protected Sheet createSheet(){
        Sheet sheet = Sheet.createDefault();
        return sheet;
    }
}
