/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.UPPGDrainTank;
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
public class UPPGDrainTankJpaController implements Serializable {

    public UPPGDrainTankJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(UPPGDrainTank UPPGDrainTank) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(UPPGDrainTank);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findUPPGDrainTank(UPPGDrainTank.getId()) != null) {
                throw new PreexistingEntityException("UPPGDrainTank " + UPPGDrainTank + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(UPPGDrainTank UPPGDrainTank) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            UPPGDrainTank = em.merge(UPPGDrainTank);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = UPPGDrainTank.getId();
                if (findUPPGDrainTank(id) == null) {
                    throw new NonexistentEntityException("The uPPGDrainTank with id " + id + " no longer exists.");
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
            UPPGDrainTank UPPGDrainTank;
            try {
                UPPGDrainTank = em.getReference(UPPGDrainTank.class, id);
                UPPGDrainTank.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The UPPGDrainTank with id " + id + " no longer exists.", enfe);
            }
            em.remove(UPPGDrainTank);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<UPPGDrainTank> findUPPGDrainTankEntities() {
        return findUPPGDrainTankEntities(true, -1, -1);
    }

    public List<UPPGDrainTank> findUPPGDrainTankEntities(int maxResults, int firstResult) {
        return findUPPGDrainTankEntities(false, maxResults, firstResult);
    }

    private List<UPPGDrainTank> findUPPGDrainTankEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(UPPGDrainTank.class));
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

    public UPPGDrainTank findUPPGDrainTank(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(UPPGDrainTank.class, id);
        } finally {
            em.close();
        }
    }

    public int getUPPGDrainTankCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<UPPGDrainTank> rt = cq.from(UPPGDrainTank.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
