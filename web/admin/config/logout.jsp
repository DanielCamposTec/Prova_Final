<%-- 
    Document   : logout
    Created on : 9 de nov. de 2022, 11:04:16
    Author     : DellG5
--%>


<%
    session.invalidate();//Encerra a sess�o do usuario
    response.sendRedirect("../index.jsp?erro=4");//Redireciona para login msg -> sua sess�o foi encerrada
%>