package com.alexprom.entities.dictionary;

import com.alexprom.entities.dictionary.gradId;
import java.math.BigInteger;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-12T09:40:56")
@StaticMetamodel(GradView.class)
public class GradView_ { 

    public static volatile SingularAttribute<GradView, String> tankName;
    public static volatile SingularAttribute<GradView, Short> matLevel;
    public static volatile SingularAttribute<GradView, BigInteger> tankId;
    public static volatile SingularAttribute<GradView, gradId> id;
    public static volatile SingularAttribute<GradView, BigInteger> matVolume;

}