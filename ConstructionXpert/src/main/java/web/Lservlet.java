package web;

import java.io.IOException;
import java.util.List;

import dao.ImpProjets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Projets;

@WebServlet("/")
public class Lservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	  ImpProjets projetsDAO = new ImpProjets();
          List<Projets> projetsList = projetsDAO.selectAllProjets();
          System.out.print(projetsList);
          request.setAttribute("projetsList", projetsList);
          request.getRequestDispatcher("/WEB-INF/Projets.jsp").forward(request, response);
    }

  
    protected void AFFI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImpProjets projetsDAO = new ImpProjets();
        List<Projets> projetsList = projetsDAO.selectAllProjets();
        System.out.print(projetsList);
        request.setAttribute("projetsList", projetsList);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }
}
