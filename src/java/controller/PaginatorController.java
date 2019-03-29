/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SearchProductDao;
import dao.WrapperProductDao;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Product;
import model.WrappedProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Tasos
 */
@Controller
public class PaginatorController {
    
    @Autowired
    private WrapperProductDao wrapperdao;
    @Autowired
    private SearchProductDao searchPrdao;
    
    
   /* @RequestMapping(value="/pagination/{page}.htm", method = RequestMethod.GET)
    public String storeItems(ModelMap model, @PathVariable("page") String page,  HttpSession session){
        
        int storeId = (int) session.getAttribute("id");
         session.setAttribute("storeId",storeId);
        int currentpage=Integer.parseInt(page);
        int rows=12*(currentpage-1)+1;
        ArrayList<Product> products = searchPrdao.fetchAllProductsByStore(storeId,rows); //h fetchAllProductsByStore products argei
        ArrayList<WrappedProduct> wrapped = wrapperdao.GetWrappedPr(products);
        model.addAttribute("wrapped", wrapped);
        
        
        return "homepage";
}*/
}
