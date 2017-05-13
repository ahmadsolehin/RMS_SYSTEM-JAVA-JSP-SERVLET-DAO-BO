
package rms.bo;

import java.util.List;
import rms.dao.ContractorDAO;
import rms.model.Contractor;

public class ContractorBO {
    
    public static void addContractor(Contractor con) throws Exception{
        ContractorDAO.addContractor(con);
    };
    
    public static void deleteContractor(int id) throws Exception{
        ContractorDAO.deleteContractor(id);
    };    
    
    public static void updateContractor(Contractor con) throws Exception{
        ContractorDAO.updateContractor(con);
    }
    
    public static Contractor getContractorByID(int id) throws Exception{ //ambik id dari view.jsp dan hantar ke update.jsp
    return ContractorDAO.getContractor(id);
    }
    
    public static List<Contractor> listAllContractor() throws Exception{
        return ContractorDAO.listAllContractor();
    }
    public static List<Contractor> searchContractor(String keysearch) throws Exception{        
       return ContractorDAO.searchContractorByCodeAndName(keysearch);
    }
     public static void senddataContractor(int id) throws Exception{
        ContractorDAO.senddataContractor(id);
    }; 
}
