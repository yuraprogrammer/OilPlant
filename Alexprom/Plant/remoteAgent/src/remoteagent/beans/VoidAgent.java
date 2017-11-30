package remoteagent.beans;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

/**
 *
 * @author yura_
 */
public class VoidAgent extends AgentBase{
    
    private final List<String> levelTags = new ArrayList<>();
    private final List<String> volumeTags = new ArrayList<>();
    private final List<String> tankID = new ArrayList<>();    
    
    public VoidAgent(){
        super();
    }
    
        //Получение задания для агента
    @Override
    public void getTask() throws PersistenceException{        
        EntityManager em = Persistence.createEntityManagerFactory("remoteAgent_Config").createEntityManager();
        Query query = em.createNamedQuery("ViewLevelTags.findByNodeClassName");
  
        query.setParameter("varClass", 0);
        query.setParameter("name", "1");
        levelTags.addAll(query.getResultList());
            
        query.setParameter("varClass", 5);
        query.setParameter("name", "1");
        volumeTags.addAll(query.getResultList());
            
        query.setParameter("varClass", 6);
        query.setParameter("name", "1");
        tankID.addAll(query.getResultList());           
    }

    @Override
    public void doTask() {
        
            int count = tankID.size();
                if (count!=0){
                    for (int i=0;i<levelTags.size();i++){
                        System.out.println(levelTags.get(i));
                    }       
                }
    
    }    
    
}
