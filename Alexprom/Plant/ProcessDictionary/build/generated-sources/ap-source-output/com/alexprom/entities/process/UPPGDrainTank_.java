package com.alexprom.entities.process;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-12T09:40:56")
@StaticMetamodel(UPPGDrainTank.class)
public class UPPGDrainTank_ { 

    public static volatile SingularAttribute<UPPGDrainTank, Integer> volume;
    public static volatile SingularAttribute<UPPGDrainTank, Integer> finishLevel;
    public static volatile SingularAttribute<UPPGDrainTank, BigDecimal> density;
    public static volatile SingularAttribute<UPPGDrainTank, BigDecimal> mass;
    public static volatile SingularAttribute<UPPGDrainTank, BigDecimal> drained;
    public static volatile SingularAttribute<UPPGDrainTank, Long> actID;
    public static volatile SingularAttribute<UPPGDrainTank, BigDecimal> drainedBLF;
    public static volatile SingularAttribute<UPPGDrainTank, Integer> tankID;
    public static volatile SingularAttribute<UPPGDrainTank, Long> id;
    public static volatile SingularAttribute<UPPGDrainTank, Integer> startLevel;

}