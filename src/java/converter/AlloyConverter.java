/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package converter;

import dao.AlloyDao;
import model.Alloy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 *
 * @author chern
 */
@Component
public class AlloyConverter implements Converter<Integer, Alloy>{
    
    @Autowired 
    AlloyDao alloydao;

    @Override
    public Alloy convert(Integer alloyId) {
        return alloydao.GetAlloy(alloyId);
    }
}
