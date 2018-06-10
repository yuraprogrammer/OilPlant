/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.service;

import com.alexprom.entities.process.ActSirie;
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
public class ActSirieJpaController implements Serializable {

    public ActSirieJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ActSirie actSirie) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(actSirie);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findActSirie(actSirie.getId()) != null) {
                throw new PreexistingEntityException("ActSirie " + actSirie + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ActSirie actSirie) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            actSirie = em.merge(actSirie);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = actSirie.getId();
                if (findActSirie(id) == null) {
                    throw new NonexistentEntityException("The actSirie with id " + id + " no longer exists.");
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
            ActSirie actSirie;
            try {
                actSirie = em.getReference(ActSirie.class, id);
                actSirie.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The actSirie with id " + id + " no longer exists.", enfe);
            }
            em.remove(actSirie);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<ActSirie> findActSirieEntities() {
        return findActSirieEntities(true, -1, -1);
    }

    public List<ActSirie> findActSirieEntities(int maxResults, int firstResult) {
        return findActSirieEntities(false, maxResults, firstResult);
    }

    private List<ActSirie> findActSirieEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ActSirie.class));
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

    public ActSirie findActSirie(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ActSirie.class, id);
        } finally {
            em.close();
        }
    }

    public int getActSirieCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ActSirie> rt = cq.from(ActSirie.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
