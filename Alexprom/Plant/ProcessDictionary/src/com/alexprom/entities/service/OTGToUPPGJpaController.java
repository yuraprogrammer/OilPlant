/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.OTGToUPPG;
import com.alexprom.entities.service.exceptions.NonexistentEntityException;
import com.alexprom.entities.service.exceptions.PreexistingEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author yura_
 */
public class OTGToUPPGJpaController implements Serializable {

    public OTGToUPPGJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(OTGToUPPG OTGToUPPG) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(OTGToUPPG);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findOTGToUPPG(OTGToUPPG.getId()) != null) {
                throw new PreexistingEntityException("OTGToUPPG " + OTGToUPPG + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(OTGToUPPG OTGToUPPG) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            OTGToUPPG = em.merge(OTGToUPPG);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = OTGToUPPG.getId();
                if (findOTGToUPPG(id) == null) {
                    throw new NonexistentEntityException("The oTGToUPPG with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            OTGToUPPG OTGToUPPG;
            try {
                OTGToUPPG = em.getReference(OTGToUPPG.class, id);
                OTGToUPPG.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The OTGToUPPG with id " + id + " no longer exists.", enfe);
            }
            em.remove(OTGToUPPG);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<OTGToUPPG> findOTGToUPPGEntities() {
        return findOTGToUPPGEntities(true, -1, -1);
    }

    public List<OTGToUPPG> findOTGToUPPGEntities(int maxResults, int firstResult) {
        return findOTGToUPPGEntities(false, maxResults, firstResult);
    }

    private List<OTGToUPPG> findOTGToUPPGEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(OTGToUPPG.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public OTGToUPPG findOTGToUPPG(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(OTGToUPPG.class, id);
        } finally {
            em.close();
        }
    }

    public int getOTGToUPPGCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<OTGToUPPG> rt = cq.from(OTGToUPPG.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
