<%-- 
    Document   : CarritoView
    Created on : 22-abr-2019, 18:00:27
    Author     : HP PC
--%>

<%@page import="java.util.Iterator"%>
<%@page import="tours.prograii.objects.CarritoView"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objsesion = request.getSession(false);
    String usuario = (String)objsesion.getAttribute("usuario");
String strLoginId = (String)objsesion.getAttribute("strLoginId");  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo</title>
        <link href="Style/sidebar.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="JavaScript/ScriptInicio.js" type="text/javascript"></script>
        <link href="Style/HeaderInicio.css" rel="stylesheet" type="text/css"/>
        <link href="Style/ImagenStyle.css" rel="stylesheet" type="text/css"/>
        <link href="Style/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="animate.css" rel="stylesheet" type="text/css"/>
        <link href="Style/eventos.css" rel="stylesheet" type="text/css"/>
        <link href="Style/column.css" rel="stylesheet" type="text/css"/>
    </head>
    <%
        ArrayList<CarritoView> CArray = 
                (ArrayList<CarritoView>)request.getSession().getAttribute("view");
        Iterator<CarritoView> iteArray = CArray.iterator();
        
    %>
    <style>   *{
              font-family: Arial, Helvetica, sans-serif;

        }
                        .a1 {
              text-decoration: none;
              font-size: 30px;
              color: black;
              
            }

             a1:hover {
              opacity: 0.7;
            }
            input{
                  font-family: Arial, Helvetica, sans-serif;
                  font-size: 18px;
                  text-align: center;
                  font-weight: bold;
                  width: 100%;
            }
            label{
                font-size: 18px;
            }
            .boton {
  border: none;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}
            .success {background-color: #4CAF50;} /* Green */
.success:hover {background-color: #46a049;}

.info {background-color: #2196F3;} /* Blue */
.info:hover {background: #0b7dda;}

.warning {background-color: #ff9800;} /* Orange */
.warning:hover {background: #e68a00;}

.danger {background-color: #f44336;} /* Red */ 
.danger:hover {background: #da190b;}

.default {background-color: #e7e7e7; color: black;} /* Gray */ 
.default:hover {background: #ddd;}
            </style>
    <body>
        <div class="navbar">  
            <img class="logo" src="imagenes/Logo.png" alt="logo"/>
            
            <a href="#ayuda">Ayuda</a>          
          <div class="dropdown">        
          <button class="dropbtn" onclick="myFunction()">Categorías
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content" id="myDropdown">
            <a href="CatServlet?formid=2&categoria=Cultural">Cultural</a>
            <a href="CatServlet?formid=2&categoria=Recreativo">Recreativo</a>
            <a href="CatServlet?formid=2&categoria=Grupos Ideologicos">Grupos Ideológicos</a>
            <a href="CatServlet?formid=2&categoria=Deportivo">Deportivo</a>
            <a href="CatServlet?formid=2&categoria=Rural">Rural</a>
            <a href="CatServlet?formid=2&categoria=Urbano">Urbano</a>
            <a href="CatServlet?formid=2&categoria=De Aventura">De Aventura</a>
            <a href="CatServlet?formid=2&categoria=De Negocios">De Negocios</a>
            <a href="CatServlet?formid=2&categoria=Ecologico">Ecológico</a>
            <a href="CatServlet?formid=2&categoria=Religioso">Religioso</a>
            <a href="CatServlet?formid=2&categoria=Gastronomico">Gastronómico</a>
     
          </div>
          </div>
          <a href="javascript:window.history.go(-1)">Inicio</a>
          </div>
      
        <%
            if(iteArray!=null)
            {
                CarritoView CTemp;
                while(iteArray.hasNext())
                {
                    CTemp = iteArray.next();
        %>      
                 <div style="padding: 10px; float: left; width: 420px; height: 420px ; margin-right: 50px; margin-left: 80px;
                       margin-bottom: 50px;" class="card">
            <h2 style="text-align:center" class="boton warning"> Usuario: <%=CTemp.getUsername() %></h2><br>
                    <img src="imagenes/avatar evento.jpg" alt="Imagen" style="width:100%">
                   
            <br><br>
                    
                        <a href="#" class="boton info" style="text-decoration:none">
                           Evento: #<%= CTemp.getIdEvento() %>
                        </a>
                            <br><br><br>
                        <a href="" class="boton danger" style="text-decoration:none">
                         Total: $ <%= CTemp.getTotal() %>.00
                        </a>
                 </div>
        <%
                }
            }
        %>
        
       
        
       
    </body>
</html>