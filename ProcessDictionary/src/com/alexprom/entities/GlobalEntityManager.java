package com.alexprom.entities;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;


public class GlobalEntityManager {
    private EntityManagerFactory emf;
    private EntityManager em;
    
    public GlobalEntityManager(EntityManagerFactory emf, EntityManager em){
        this.emf = emf;
        this.em = em;
    }

    public EntityManagerFactory getEmf() {
        return emf;
    }

    public void setEmf(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }
    
    
}
