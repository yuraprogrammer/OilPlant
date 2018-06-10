/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.ActCounters;
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
public class ActCountersJpaController implements Serializable {

    public ActCountersJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ActCounters actCounters) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(actCounters);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findActCounters(actCounters.getId()) != null) {
                throw new PreexistingEntityException("ActCounters " + actCounters + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ActCounters actCounters) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            actCounters = em.merge(actCounters);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = actCounters.getId();
                if (findActCounters(id) == null) {
                    throw new NonexistentEntityException("The actCounters with id " + id + " no longer exists.");
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
            ActCounters actCounters;
            try {
                actCounters = em.getReference(ActCounters.class, id);
                actCounters.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The actCounters with id " + id + " no longer exists.", enfe);
            }
            em.remove(actCounters);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ActCounters> findActCountersEntities() {
        return findActCountersEntities(true, -1, -1);
    }

    public List<ActCounters> findActCountersEntities(int maxResults, int firstResult) {
        return findActCountersEntities(false, maxResults, firstResult);
    }

    private List<ActCounters> findActCountersEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ActCounters.class));
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

    public ActCounters findActCounters(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ActCounters.class, id);
        } finally {
            em.close();
        }
    }

    public int getActCountersCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ActCounters> rt = cq.from(ActCounters.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
