/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Tasos
 */
@Entity
@Table(name = "ProductView")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductView.findAll", query = "SELECT p FROM ProductView p")})
public class ProductView implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "product_code")
    private String productCode;
    @Size(max = 500)
    @Column(name = "stone_desc")
    private String stoneDesc;
    @Size(max = 45)
    @Column(name = "pcolor")
    private String pcolor;

    public ProductView() {
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getStoneDesc() {
        return stoneDesc;
    }

    public void setStoneDesc(String stoneDesc) {
        this.stoneDesc = stoneDesc;
    }

    public String getPcolor() {
        return pcolor;
    }

    public void setPcolor(String pcolor) {
        this.pcolor = pcolor;
    }
    
}
