/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.ActSirieMixing;
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
public class ActSirieMixingJpaController implements Serializable {

    public ActSirieMixingJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ActSirieMixing actSirieMixing) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(actSirieMixing);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findActSirieMixing(actSirieMixing.getId()) != null) {
                throw new PreexistingEntityException("ActSirieMixing " + actSirieMixing + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ActSirieMixing actSirieMixing) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            actSirieMixing = em.merge(actSirieMixing);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = actSirieMixing.getId();
                if (findActSirieMixing(id) == null) {
                    throw new NonexistentEntityException("The actSirieMixing with id " + id + " no longer exists.");
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
            ActSirieMixing actSirieMixing;
            try {
                actSirieMixing = em.getReference(ActSirieMixing.class, id);
                actSirieMixing.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The actSirieMixing with id " + id + " no longer exists.", enfe);
            }
            em.remove(actSirieMixing);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ActSirieMixing> findActSirieMixingEntities() {
        return findActSirieMixingEntities(true, -1, -1);
    }

    public List<ActSirieMixing> findActSirieMixingEntities(int maxResults, int firstResult) {
        return findActSirieMixingEntities(false, maxResults, firstResult);
    }

    private List<ActSirieMixing> findActSirieMixingEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ActSirieMixing.class));
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

    public ActSirieMixing findActSirieMixing(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ActSirieMixing.class, id);
        } finally {
            em.close();
        }
    }

    public int getActSirieMixingCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ActSirieMixing> rt = cq.from(ActSirieMixing.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
