/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.ActDensity20;
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
public class ActDensity20JpaController implements Serializable {

    public ActDensity20JpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ActDensity20 actDensity20) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(actDensity20);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findActDensity20(actDensity20.getId()) != null) {
                throw new PreexistingEntityException("ActDensity20 " + actDensity20 + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ActDensity20 actDensity20) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            actDensity20 = em.merge(actDensity20);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = actDensity20.getId();
                if (findActDensity20(id) == null) {
                    throw new NonexistentEntityException("The actDensity20 with id " + id + " no longer exists.");
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
            ActDensity20 actDensity20;
            try {
                actDensity20 = em.getReference(ActDensity20.class, id);
                actDensity20.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The actDensity20 with id " + id + " no longer exists.", enfe);
            }
            em.remove(actDensity20);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ActDensity20> findActDensity20Entities() {
        return findActDensity20Entities(true, -1, -1);
    }

    public List<ActDensity20> findActDensity20Entities(int maxResults, int firstResult) {
        return findActDensity20Entities(false, maxResults, firstResult);
    }

    private List<ActDensity20> findActDensity20Entities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ActDensity20.class));
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

    public ActDensity20 findActDensity20(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ActDensity20.class, id);
        } finally {
            em.close();
        }
    }

    public int getActDensity20Count() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ActDensity20> rt = cq.from(ActDensity20.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
