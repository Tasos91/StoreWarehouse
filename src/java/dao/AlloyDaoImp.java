package dao;


import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import model.Alloy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AlloyDaoImp implements AlloyDao{
    
    @PersistenceContext
    private EntityManager em;
    
    @Transactional
    @Override
    public void addAlloy(Alloy alloy) {
        em.persist(alloy);
    }

    @Override
    public Alloy GetAlloy(Integer alloyId){ 
         
         Alloy alloy = new Alloy();
         String sql = "SELECT a FROM Alloy a WHERE a.alloyId = :alloyId";
         Query query = em.createQuery(sql);
         query.setParameter("alloyId", alloyId);
         alloy = (Alloy) query.getSingleResult();
         return alloy;
   }
    @Override
    public ArrayList<Alloy> fetchAlloys() {
          
        String sql = "SELECT a FROM Alloy a ";
        Query query = em.createQuery(sql);
        ArrayList<Alloy> alloys = (ArrayList<Alloy>) query.getResultList();
        return alloys;
    }
    
    
    
    
    
}
