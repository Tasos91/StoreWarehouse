<%-- 
    Document   : zoomProduct
    Created on : 02-Dec-2018, 15:45:44
    Author     : Katy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous">
        </script>
        <link href="<c:url value= "/resources/css/Style1.css "/>" rel="stylesheet">
        <link href="<c:url value= "/resources/css/productCard.css "/>" rel="stylesheet">
        <link href="<c:url value= "/resources/javascript/pagination1.js "/>" rel="stylesheet">
        <link href="<c:url value= "/resources/css/pagination_style.css "/>" rel="stylesheet">
        
        <title>JSP Page</title>
        <style>
        body{
                background-image: url('./velvet1.jpg');
            }
            </style>
            <style>
                /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 22 Ιαν 2019, 6:26:29 μμ
    Author     : Tasos
*/

$border-color: #3D315B;
$background-color: #266DD3;
$list-background-color: #444B6E;
$active-list-background-color: #9AB87A;
$border-radius: 5px;

* {
  font-family: 'Poppins';
}
body {
  background-color: $background-color;!important
  margin: 0;
}
a:hover {
  cursor: pointer;
}
#pagination {
  display: flex;
  
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  li {
    color: #fff;
    display: flex;
    a {
      background-color: #444B6E;
      padding: 5px 10px;
      border: 2px solid $border-color;
      border-right: 0;
    }
  }
  // li.previous,
  // li.next {
  //   animation: fadein .5s;
  // }
  li.active a {
    background-color: $active-list-background-color;
  }
  li:first-child a {
    border-radius: $border-radius 0 0 $border-radius;
  }
  li:last-child a {
    border-radius: 0 $border-radius $border-radius 0;
    border-right: 2px solid $border-color;
  }
}
            </style>
            
        </head>
        
    <body>
        <header>
            <h3 class="headerText1" style="margin-left: 50px"></h3>
               <form action="searchById.htm" method="get" style="float:right">
                <input type="text" name="pcode" >
                <input type="submit" name="submit" value="search">
              </form>
        </header>
        <div class="topnav">
            <div style="color:white"><h6 style="float:left" style="margin-left:2px">CATEGORIES</h6></div>
            <a href="logout.htm" class="logout" style="float:right">Logout</a>
               <a href="${contextPath}/creator.htm" style="float:right">Create new Product</a>
                 <a href="${contextPath}/history.htm" style="float:right">Stock History</a>
                   <a href="${contextPath}/registrationFormController.htm" style="float:right">Create new Store</a>
          
      </div>
       
        <div class="column side">
            
            
            <c:forEach items="${categories}" var="current">
                <a href="${contextPath}/searchByCategory/${current.categoryId}.htm" class="myclass" >${current.categoryDesc}</a>
            </c:forEach>  
         </div>    
    <div class="column middle">
        <div class="container">
                    <c:forEach items="${wrapped}" var="current">
                      <div class="item2">
                         <div class="card">
                           <c:choose>  
                                <c:when test="${current.prview.pcolor=='W'}"><p class="price">White</p> </c:when>
                                <c:when test="${current.prview.pcolor=='Y'}"><p class="price">Yellow</p> </c:when>
                                <c:when test="${current.prview.pcolor=='R'}"><p class="price">Pink</p> </c:when>
                                <c:otherwise><p class="price">No color inserted</p></c:otherwise>
                            </c:choose> 
                           <img src="/images/${current.product.img}" alt="ProductImage" style="width:100%">
                           <p class="price">Stone: ${current.prview.stoneDesc}</p> 
                           <p class="desc">Gold: <c:if test="${current.alloy.goldWeight > 0}"><span> ${current.alloy.silverWeight}</span></c:if>Silver: <c:if test="${current.alloy.silverWeight > 0}"><span>${current.alloy.silverWeight}</span> </c:if> </p> 
                           <p class="desc">Producer: ${current.producer.producerName}</p>
                           <p class="price">Price:  ${current.product.price}</p>
                           <p class="price">Product code: ${current.product.productCode}</p>
                           <button class="button"><a href="${contextPath}/zoomProduct/${current.product.productCode}.htm">Show</a></button>
                    </div>
                      </div>
                    </c:forEach>
            <input type="hidden" name="page" id="hiddenField"/>
        </div>
    </div>
            <div class="columnr side">
                
            </div>
                   <div class="footer">
    <div id="pagination"></div>   
    </div>
                   
            
   <script>
     console.log(<%= session.getAttribute("currentpage") %>);
                let pages = 100;
document.getElementById('pagination').innerHTML = createPagination(pages, <%= session.getAttribute("currentpage") %>);
function createPagination(pages, page) {
  let str = '<ul>';
  let active;
  let pageCutLow = page - 1;
  let pageCutHigh = page + 1;
  
  // Show the Previous button only if you are on a page other than the first
  if (page > 0) {
    str += '<li class="page-item previous no"><a href="${contextPath}/pagination/'+(page-1)+'.htm" onclick="createPagination(pages, '+(page-1)+')">Previous</a></li>';
  }
  if(page === 0) { //prosthiki
    str += '<li class="page-item previous no"><a href="${contextPath}/pagination/'+page+'.htm" onclick="createPagination(pages, '+page+')">0</a></li>';
  }
  
  // Show all the pagination elements if there are less than 6 pages total
  if (pages < 6 ) {
    for (let p = 0; p <= pages; p++) {
      active = page == p ? "active" : "no";
      str += '<li class="'+active+'"><a href="${contextPath}/pagination/'+p+'.htm" onclick="createPagination(pages, '+p+')">'+ p +'</a></li>';
      
    }
    
  }
  // Use "..." to collapse pages outside of a certain range
  else {
    // Show the very first page followed by a "..." at the beginning of the
    // pagination section (after the Previous button)
    if (page > 2) {
      str += '<li class="no page-item"><a href="${contextPath}/pagination/'+page+'.htm" onclick="createPagination(pages, 1)">'+ p +'</a></li>';
      if (page > 3) {
          str += '<li class="out-of-range"><a href="${contextPath}/pagination/'+page+'.htm" onclick="createPagination(pages,'+(page-2)+')">...</a></li>';
      }
      
    }
    // Determine how many pages to show after the current page index
    if (page === 1) {
      pageCutHigh += 2;
    } else if (page === 2) {
      pageCutHigh += 1;
    }
    // Determine how many pages to show before the current page index
    if (page === pages) {
      pageCutLow -= 2;
    } else if (page === pages-1) {
      pageCutLow -= 1;
    }
    // Output the indexes for pages that fall inside the range of pageCutLow
    // and pageCutHigh
    for (let p = pageCutLow; p <= pageCutHigh; p++) {
      if (p === 0) {
        p += 1;
      }
      if (p > pages) {
        continue
      }
      active = page == p ? "active" : "no";
      str += '<li class="page-item '+active+'"><a href="${contextPath}/pagination/'+p+'.htm" onclick="createPagination(pages, '+p+')">'+ p +'</a></li>';
    }
    // Show the very last page preceded by a "..." at the end of the pagination
    // section (before the Next button)
    if (page < pages-1) {
      if (page < pages-2) {
        str += '<li class="out-of-range"><a href="${contextPath}/pagination/'+page+2+'.htm" onclick="createPagination(pages,'+(page+2)+')">...</a></li>';
      }
      str += '<li class="page-item no"><a href="${contextPath}/pagination/'+pages+'.htm" onclick="createPagination(pages, pages)">'+pages+'</a></li>';
    }
  }
  // Show the Next button only if you are on a page other than the last
  if (page < pages) {
    str += '<li class="page-item next no"><a href="${contextPath}/pagination/'+(page+1)+'.htm" onclick="createPagination(pages, '+(page+1)+')">Next</a></li>';
  }
  str += '</ul>';
  // Return the pagination string to be outputted in the pug templates
  document.getElementById('pagination').innerHTML = str;
                
   
   document.getElementById('hiddenField').value=page;
  return str;
}
            </script>
        
    </body>
    
</html>
