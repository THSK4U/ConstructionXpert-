package web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dao.ImpProjets;
import dao.InProjets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Projets;

@WebServlet("/")
public class Lservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ImpProjets ImpProjets;

  
    public Lservlet() {
        this.ImpProjets = new ImpProjets();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
//---------------------home-------------------------------------
        case "/":
        	home(request, response);
            break;
//---------------------Projets-----------------------------------

            case "/confirmationProject":
                deletForm(request, response);
                break;
            case "/deleteProject":
            	processDelete(request, response);
                break;
            case "/addProject":
            	Save(request, response);
                break;
            case "/modifierProject":
            	processEdit(request, response);
            	break;
            case "/Done":
            	processUpdate(request, response);
            	break;
            case "/Projets":
            	afficher(request, response);
                break;
//---------------------------------------------
            
        }
    }
//---------------page Home------------------------------------
    protected void home(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        request.getRequestDispatcher("/WEB-INF/home/home.jsp").forward(request, response);
    }
 //---------------Crud Projets------------------------------------

    private void Save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 String nom = request.getParameter("nom");
         String description = request.getParameter("description");
         Date dateDebut = Date.valueOf(request.getParameter("dateDebut"));
         Date dateFin = Date.valueOf(request.getParameter("dateFin"));
         double budget = Double.parseDouble(request.getParameter("budget"));

         Projets newProject = new Projets(nom, description, dateDebut, dateFin, budget);
         ImpProjets.save(newProject);
         response.sendRedirect(request.getContextPath() + "/Projets");
    	
    }
    protected void afficher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	InProjets projetsDAO = new ImpProjets();
        List<Projets> projetsList = projetsDAO.selectAllProjets();
        request.setAttribute("projetsList", projetsList);
        request.getRequestDispatcher("/WEB-INF/Projets/Projets.jsp").forward(request, response);
    }

    protected void deletForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        request.getRequestDispatcher("/WEB-INF/Projets/Formdelet.jsp").forward(request, response);
    }
    
    private void processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ImpProjets.deletProjets(id);
        response.sendRedirect(request.getContextPath() + "/Projets");
    }
    
    private void processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Projets Projets = ImpProjets.getProjets(id);
        request.setAttribute("Projets", Projets);
      request.getRequestDispatcher("/WEB-INF/Projets/edit.jsp").forward(request, response);
    }
    
    private void processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		 String nom = request.getParameter("nom");
         String description = request.getParameter("description");
         Date dateDebut = Date.valueOf(request.getParameter("dateDebut"));
         Date dateFin = Date.valueOf(request.getParameter("dateFin"));
         double budget = Double.parseDouble(request.getParameter("budget"));

        Projets Project = new Projets(id,nom, description, dateDebut, dateFin, budget);
        ImpProjets.update(Project);

        response.sendRedirect(request.getContextPath() + "/Projets");
    }
}
//-------------Crud Tâches-------------

