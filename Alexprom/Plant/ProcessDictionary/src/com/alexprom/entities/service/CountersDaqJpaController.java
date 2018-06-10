/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.CountersDaq;
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
public class CountersDaqJpaController implements Serializable {

    public CountersDaqJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(CountersDaq countersDaq) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(countersDaq);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findCountersDaq(countersDaq.getId()) != null) {
                throw new PreexistingEntityException("CountersDaq " + countersDaq + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(CountersDaq countersDaq) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            countersDaq = em.merge(countersDaq);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = countersDaq.getId();
                if (findCountersDaq(id) == null) {
                    throw new NonexistentEntityException("The countersDaq with id " + id + " no longer exists.");
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
            CountersDaq countersDaq;
            try {
                countersDaq = em.getReference(CountersDaq.class, id);
                countersDaq.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The countersDaq with id " + id + " no longer exists.", enfe);
            }
            em.remove(countersDaq);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<CountersDaq> findCountersDaqEntities() {
        return findCountersDaqEntities(true, -1, -1);
    }

    public List<CountersDaq> findCountersDaqEntities(int maxResults, int firstResult) {
        return findCountersDaqEntities(false, maxResults, firstResult);
    }

    private List<CountersDaq> findCountersDaqEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(CountersDaq.class));
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

    public CountersDaq findCountersDaq(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(CountersDaq.class, id);
        } finally {
            em.close();
        }
    }

    public int getCountersDaqCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<CountersDaq> rt = cq.from(CountersDaq.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
