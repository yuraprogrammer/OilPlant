package com.alexprom.entities.dictionary;

import com.alexprom.entities.dictionary.reportId;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-06-03T09:41:31")
@StaticMetamodel(ExcelReportData.class)
public class ExcelReportData_ { 

    public static volatile SingularAttribute<ExcelReportData, BigDecimal> avgValue;
    public static volatile SingularAttribute<ExcelReportData, BigDecimal> minValue;
    public static volatile SingularAttribute<ExcelReportData, String> aTag;
    public static volatile SingularAttribute<ExcelReportData, BigDecimal> maxValue;
    public static volatile SingularAttribute<ExcelReportData, Date> aDate;
    public static volatile SingularAttribute<ExcelReportData, Integer> aShift;
    public static volatile SingularAttribute<ExcelReportData, reportId> id;

}