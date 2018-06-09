/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.OTGToTSP;
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
public class OTGToTSPJpaController implements Serializable {

    public OTGToTSPJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(OTGToTSP OTGToTSP) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(OTGToTSP);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findOTGToTSP(OTGToTSP.getId()) != null) {
                throw new PreexistingEntityException("OTGToTSP " + OTGToTSP + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(OTGToTSP OTGToTSP) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            OTGToTSP = em.merge(OTGToTSP);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = OTGToTSP.getId();
                if (findOTGToTSP(id) == null) {
                    throw new NonexistentEntityException("The oTGToTSP with id " + id + " no longer exists.");
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
            OTGToTSP OTGToTSP;
            try {
                OTGToTSP = em.getReference(OTGToTSP.class, id);
                OTGToTSP.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The OTGToTSP with id " + id + " no longer exists.", enfe);
            }
            em.remove(OTGToTSP);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<OTGToTSP> findOTGToTSPEntities() {
        return findOTGToTSPEntities(true, -1, -1);
    }

    public List<OTGToTSP> findOTGToTSPEntities(int maxResults, int firstResult) {
        return findOTGToTSPEntities(false, maxResults, firstResult);
    }

    private List<OTGToTSP> findOTGToTSPEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(OTGToTSP.class));
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

    public OTGToTSP findOTGToTSP(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(OTGToTSP.class, id);
        } finally {
            em.close();
        }
    }

    public int getOTGToTSPCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<OTGToTSP> rt = cq.from(OTGToTSP.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
