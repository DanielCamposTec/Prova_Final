<%-- 
    Document   : cadastraUsuarios
    Created on : 9 de nov. de 2022, 11:04:01
    Author     : DellG5
--%>
<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%

    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String senha = request.getParameter("senha");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/website";
    String usuario = "postgres";
    String senhaBD = "123452020";
    
    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,usuario,senhaBD);
        st = con.createStatement();
        st.execute("Insert into usuarios(nome,email,telefone,senha)VALUES('"+nome+"', '"+email+"', '"+telefone+"', '"+senha+"') ");
        response.sendRedirect("../usuarios.jsp?status=1");
    }catch(Exception e){
        out.print(e);
    }

%>