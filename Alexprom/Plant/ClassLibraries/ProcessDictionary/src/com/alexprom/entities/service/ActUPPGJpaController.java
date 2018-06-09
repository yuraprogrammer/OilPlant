/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.ActUPPG;
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
public class ActUPPGJpaController implements Serializable {

    public ActUPPGJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ActUPPG actUPPG) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(actUPPG);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findActUPPG(actUPPG.getId()) != null) {
                throw new PreexistingEntityException("ActUPPG " + actUPPG + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ActUPPG actUPPG) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            actUPPG = em.merge(actUPPG);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = actUPPG.getId();
                if (findActUPPG(id) == null) {
                    throw new NonexistentEntityException("The actUPPG with id " + id + " no longer exists.");
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
            ActUPPG actUPPG;
            try {
                actUPPG = em.getReference(ActUPPG.class, id);
                actUPPG.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The actUPPG with id " + id + " no longer exists.", enfe);
            }
            em.remove(actUPPG);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ActUPPG> findActUPPGEntities() {
        return findActUPPGEntities(true, -1, -1);
    }

    public List<ActUPPG> findActUPPGEntities(int maxResults, int firstResult) {
        return findActUPPGEntities(false, maxResults, firstResult);
    }

    private List<ActUPPG> findActUPPGEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ActUPPG.class));
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

    public ActUPPG findActUPPG(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ActUPPG.class, id);
        } finally {
            em.close();
        }
    }

    public int getActUPPGCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ActUPPG> rt = cq.from(ActUPPG.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
