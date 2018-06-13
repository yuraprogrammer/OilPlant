/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.w3c.dom.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author yura_
 */
public final class GlabalEntityManager {
    private EntityManagerFactory emf;
    private EntityManager em;
    private final PropertyChangeSupport supp = new PropertyChangeSupport(this);
    
    public EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }

    public EntityManager getEntityManager() {
        return em;
    }
    
    public GlabalEntityManager(){
        setEntityManagerFactory();
        setEntityManager();
    }
    
    public void setEntityManagerFactory(){        
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = null;
            try {
                db = dbf.newDocumentBuilder();
            } catch (ParserConfigurationException ex) {
                System.out.println("Unable create document!!!");
            }
            Document doc = null;
            File xmlFile = new File(System.getProperty("user.dir")+File.separator+"layer.xml");
            doc = db.parse(xmlFile);
            NodeList ipList = doc.getElementsByTagName("property");
            Node ipNode = ipList.item(0);
            NamedNodeMap attributes = ipNode.getAttributes();
            Node nameAttrib = attributes.getNamedItem("dbHost");
            String agentIP = nameAttrib.getNodeValue();
            EntityManagerFactory managerFactory = null;
            Map<String, String> persistenceMap = new HashMap<>();

            persistenceMap.put("javax.persistence.jdbc.url", "jdbc:sqlserver://"+agentIP+":1433;databaseName=Alexprom_ASUTP");
            persistenceMap.put("javax.persistence.jdbc.user", "roman");
            persistenceMap.put("javax.persistence.jdbc.password", "roman");
            persistenceMap.put("javax.persistence.jdbc.driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver");
            emf = Persistence.createEntityManagerFactory("ProcessDictionaryPU", persistenceMap);                        
        } catch (SAXException | IOException ex) {
            Logger.getLogger(GlabalEntityManager.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    public void setEntityManager(){
        em = emf.createEntityManager();
    }
    
    public void removePropertyChangeListener(PropertyChangeListener pl) {
        supp.removePropertyChangeListener(pl);
    }

    public void addPropertyChangeListener(PropertyChangeListener pl) {
        supp.addPropertyChangeListener(pl);
    }
}
