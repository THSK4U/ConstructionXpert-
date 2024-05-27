package web;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import dao.ImRessource;
import dao.ImTaches;
import dao.ImpProjets;
import dao.InProjets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Projets;
import metier.Taches;
import metier.Ressources;

@WebServlet("/")
public class Lservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ImpProjets ImpProjets;
    private ImTaches ImTaches;
    private ImRessource ImRessource;

  
    public Lservlet() {
        this.ImpProjets = new ImpProjets();
        this.ImTaches = new ImTaches();
        this.ImRessource = new ImRessource();
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
//--------------------taches-------------------------
            case "/taches":
            	afficherTâches(request, response);
                break;
            case "/addTache":
            	addtach(request, response);
                break;
            case "/SupprimerTache":
            	processDeleteTach(request, response);
                break;
            case "/modifierTacheForm":
            	modifierTacheForm(request, response);
            	break;
            case "/modifierTache":
            	modifierTache(request, response);
            	break;
//-----------------------Ressources-----------------------
            case "/Ressources":
            	afficherRessources(request, response);
                break;
            case "/addRessources":
            	addRessources(request, response);
                break;
            case "/SupprimerRessources":
            	processDeleteRessources(request, response);
                break;
            case "/modifierRessourcesForm":
            	modifierRessourcesForm(request, response);
            	break;
            case "/modifierRessources":
            	modifierRessources(request, response);
            	break;
        }
    }
//-----------------Crud Ressources---------------------------
    
    protected void afficherRessources(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
		int id = Integer.parseInt(request.getParameter("id"));
        List<Ressources> RessourcesList = ImRessource.selectAllRessources(id);
        request.setAttribute("RessourcesList", RessourcesList);
        request.getRequestDispatcher("/WEB-INF/Ressources/Afficher.jsp").forward(request, response);
    }
    
    
    private void addRessources(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
         String nom = request.getParameter("nom");
         String type = request.getParameter("type");
 		int quantite = Integer.parseInt(request.getParameter("quantite"));
        String fournisseur = request.getParameter("fournisseur");
 		int idR = Integer.parseInt(request.getParameter("idTache"));

 		Ressources Ressource = new Ressources(nom, type, quantite, fournisseur,idR);
 		System.out.println("save " + Ressource.toString());
 		ImRessource.save(Ressource);
         response.sendRedirect(request.getContextPath() + "/Ressources?id="+idR);
    }
    private void processDeleteRessources(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int idProjets = Integer.parseInt(request.getParameter("idProjets"));

		ImTaches.supprimer(id);
        response.sendRedirect(request.getContextPath() + "/Ressources?id="+ idProjets);
    }
    
    private void modifierRessourcesForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Taches taches = ImTaches.getTache(id);
        request.setAttribute("Taches", taches);
      request.getRequestDispatcher("/WEB-INF/Ressources/Edit.jsp").forward(request, response);
    	
    }
    private void modifierRessources(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
         String description = request.getParameter("description");
         Date dateDebut = Date.valueOf(request.getParameter("dateDebut"));
         Date dateFin = Date.valueOf(request.getParameter("dateFin"));
         String statut = request.getParameter("statut");
 		 int idPro = Integer.parseInt(request.getParameter("idProjets"));

        Taches Project = new Taches(id,description, dateDebut, dateFin, statut,idPro);
        ImTaches.modifier(Project);

        response.sendRedirect(request.getContextPath() + "/Ressources?id=" + idPro);
    }
    
    
//---------------Crud Tâches--------------------------------
    protected void afficherTâches(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
    	InProjets projetsDAO = new ImpProjets();
        List<Projets> projetsList = projetsDAO.selectAllProjets();
        request.setAttribute("projetsList", projetsList);
        request.getRequestDispatcher("/WEB-INF/Tâches/Afficher.jsp").forward(request, response);
    }
    
    
    private void addtach(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
		int id = Integer.parseInt(request.getParameter("id"));
         String description = request.getParameter("description");
         Date dateDebut = Date.valueOf(request.getParameter("dateDebut"));
         Date dateFin = Date.valueOf(request.getParameter("dateFin"));
         String Status = request.getParameter("Status");

         Taches netaches = new Taches(description, dateDebut, dateFin, Status,id);
         ImTaches.ajouter(netaches);
         response.sendRedirect(request.getContextPath() + "/taches?id="+ id);
    }
    private void processDeleteTach(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id ="+id);
		int idProjets = Integer.parseInt(request.getParameter("idProjets"));
		System.out.println("id ="+idProjets);
		ImTaches.supprimer(id);
        response.sendRedirect(request.getContextPath() + "/taches?id="+ idProjets);
    }
    
    private void modifierTacheForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Taches taches = ImTaches.getTache(id);
        request.setAttribute("Taches", taches);
      request.getRequestDispatcher("/WEB-INF/Tâches/Edit.jsp").forward(request, response);
    	
    }
    private void modifierTache(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
         String description = request.getParameter("description");
         Date dateDebut = Date.valueOf(request.getParameter("dateDebut"));
         Date dateFin = Date.valueOf(request.getParameter("dateFin"));
         String statut = request.getParameter("statut");
 		 int idPro = Integer.parseInt(request.getParameter("idProjets"));

        Taches Project = new Taches(id,description, dateDebut, dateFin, statut,idPro);
        ImTaches.modifier(Project);

        response.sendRedirect(request.getContextPath() + "/taches?id=" + idPro);
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

