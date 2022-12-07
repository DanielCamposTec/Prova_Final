<%-- 
    Document   : cadastraAluguel
    Created on : 5 de dez. de 2022, 21:53:53
    Author     : DellG5
--%>

<%@ page import= "java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@ page import="util.Upload" %>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    Upload up = new Upload();
    
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(),request)){
        
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String desc = up.getForm().get("descricao").toString();
        Float valor = Float.parseFloat(up.getForm().get("valormensal").toString());
        
        String url = "jdbc:postgresql://localhost:5432/website";
        String usuario = "postgres";
        String senhaBD = "123452020";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO aluguel (nome,descricao,valormensal,imagem)VALUES('"+nome+"','"+desc+"', '"+valor+"', '"+imagem+"')");
            response.sendRedirect("../aluguel.jsp?status=1");//Adicionado com sucesso
        }catch(Exception e){
            out.print(e);
        }
        
    }
    
%>