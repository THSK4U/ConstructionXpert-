<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.List" %>
<%@ page import="metier.Taches" %>
<%@ page import="dao.ImTaches" %>
<%@ page import="dao.ImpProjets" %>
<%@ page import="metier.Projets" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>X</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@800&family=Lexend:wght@100..900&family=Poetsen+One&family=Rubik:ital,wght@0,300..900;1,300..900&display=swap');
        *{
            margin: 0;
            padding: 0;
            font-family: "Lexend", sans-serif;
        }
        main{
            position: fixed;
            left: 80px;
            width: 100%;
            height:100%;
        }
        .sidebar {
            position: fixed;
            bottom: 0;
            width: 80px;
            height: 100%;
            background-color: #000000;
            overflow-y: auto;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .nav {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }
        .nav-item {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .box {
            position: absolute;
            background-color: rgba(255, 118, 41, 0.93);
            height: 50px;
            width: 50px;
            border-radius: 10px;
            z-index: -1;
            left: -80px;
            transition: left 0.3s ease;
        }
        .nav-item.active .box {
            left: 5px;
        }
        .nav-item:hover .box {
            left: -50px;
        }
        .nav-link img {
            width: 30px;
            height: 24px;
        }
        .head{
            width: 1000%;
            border-bottom: 0.15rem solid rgba(0, 0, 0, 0.1);
        }
        .navtop{
            display: flex;
            height: 90px;
            width: 100%;
            padding-left: 60px;
        }
        .navtop p{
            font-size: 2rem;
            font-weight: 700;
            padding-top: 20px;
        }
        .contenu{
            display: flex;
            height: 100%;
        }
        .ProjetsList{
            background-color: rgb(255, 255, 255);
            height: 100%;
            width: 10%;
            border-right: 0.1rem solid rgba(0, 0, 0, 0.1);
        }
        .Titre p{
            font-size: 1rem;
            font-weight: 700;
            padding-top: 20px;
            display: flex;
            justify-content: center;
        }
        .rightside{
    		width: 100%;
    		background-color: rgba(248, 248, 248, 1);
   			 padding-left: 40px;
   			 overflow: auto;
        }
        .TitrePjct p {
            font-size: 1.3rem;
            font-weight: 300;
            padding-top: 19px;

        }
        .kanban{
            width: 100%;
        }
        .kanban-board {
            display: flex;
            overflow-x: auto;
            padding-top: 10px;     
            margin: auto;
            padding-right: 100px;
      }
        .kanban-column {
            margin-right: 15px;
            background: #FFFFFF;
            border-radius: 8px;
            padding: 10px;
            overflow: auto;
            width: 30vw;
        }
        .kanban-column-header {
            padding: 5px;
            margin-bottom: 10px;
            font-weight: 700;
            font-size:small;
            user-select: none;
        }
        .kanban-item {
            background: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: background-color 0.3s;
            cursor: pointer;
        }
        .kanban-item:hover {
            background-color: #e9ecef;
        }
        .List{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .projet{
        height: 60px;
        cursor: pointer;
        transition: 0.3s ease;
        display: flex;
        align-items: center;
        padding-left: 30%;
        }
        .projet:hover{
            background-color: rgba(255, 118, 41, 0.57);  
        }
        .btn{
            border: 1px solid #ddd;
        }
        .button {
         	background-color: rgba(255, 118, 41, 0.70);	
        }
        .projet.active{
            background-color: rgba(255, 118, 41, 0.57);
        }
        .btnPosition {
  			border-radius: 10px;
  			transition: left 0.3s ease;
  			width: 100%;
  			border: 0.001rem solid rgba(0, 0, 0, 0.1);
  			margin-bottom:10px;
			}
        .btnPositionremove {
  			border-radius: 10px;
  			transition: left 0.3s ease;
  			border: 0.001rem solid rgba(0, 0, 0, 0.1);
			}
		.button:hover{
			background-color: rgba(255, 118, 41, 0.93);	
			}
            .kanban-item{
                display: flex;
            }
.kanban-content {
    margin-right: 6.7px;
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
}

.kanban-text {
    margin-bottom: 17px;
    font-family: 'Inter', sans-serif;
    font-size: 13px;
    color: #000000;
    word-break: break-word;
    word-wrap: break-word;
    white-space: normal;
    overflow-wrap: break-word;
    display: inline-block;
    max-width: 100%;
}

.kanban-dates {
    display: flex;
    flex-direction: row;
    align-self: start;
    width: fit-content;
    box-sizing: border-box;
}

.kanban-date {
    margin-right: 17.2px;
    font-family: 'Inter', sans-serif;
    font-size: 0.7rem;
    color: rgba(255, 118, 41, 0.66);
    word-break: break-words;
}

.kanban-buttons {
    display: flex;
    align-items: center;
    margin-left: auto !important;
    padding-right:10px;
}

.kanban-button {
    border-radius: 10px;
    margin-bottom: 20px;
    padding: 11px 9px 18.1px 10px;
    height: 40px;
    display: flex;
    justify-content: center;
    box-sizing: border-box;
}


.button-content {
    font-size: 16px;
    width: 16px;
    height: 10.9px;
    display: flex;
    align-items: center;
    margin-left: auto !important;
}
.btn img {
            width: 16px;
            height: 20px;
            color:black;
        }

        @media (max-width: 768px) {
            main {
                margin-left: 0;
                width: 100%;
                height: 0;
                left: 0;
            }
            .sidebar {
                width: 100%;
                height: 60px;
                bottom: 0;
                overflow: hidden;
            }
            .navtop {
                padding-top: 19px;
                display: flex;
                align-items: center;
                height: 60px;
            }
            .nav {
                flex-direction: row;
                gap: 10px;
                padding-top: 0;
            }
            .content {
                padding: 10px;
                padding-top: 70px;
            }
            .box {
                left: 5px;
                top: 60px;
            }
            .nav-item.active .box {
                left: 5px;
                top: -3px;
            }
            .nav-item:hover .box {
                left: 0;
            }
            .kanban-column {
            min-width: 250px;
        }
        .btnPosition {
  			left: 0;
			}
		
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <ul class="nav">
            <li class="nav-item ">
                <div class="box"></div>
                <a class="nav-link" href="home">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector.svg" alt="Home">
                </a>
            </li>
            <li class="nav-item ">
                <div class="box"></div>
                <a class="nav-link" href="Projets">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(1).svg" alt="Projets">
                </a>
            </li>
            <li class="nav-item active">
                <div class="box"></div>
                <a class="nav-link" href="taches">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Spotted%20Patterns.svg" alt="Tâches">
                </a>
            </li>
            <li class="nav-item ">
                <div class="box"></div>
                <a class="nav-link" href="">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(2).svg" alt="Ressources">
                </a>
            </li>
        </ul>
    </div>
<main>
    <div class="head">
    <div class="navtop">
        <p>Tâches</p>
    </div></div>

<div class="contenu">
<div class="ProjetsList">
    <div class="Titre">
        <p>Projets :</p>
    </div>
    
    <div class="List">
         <c:forEach var="projet" items="${projetsList}">
    
    <a href="taches?id=${projet.id}"><div class="projet">
    ${projet.nom}
</div></a>
   </c:forEach>
   
   
    </div>
    
</div>
  <% 
            String idParam = request.getParameter("id"); 
            if (idParam != null && !idParam.isEmpty()) { 
                int projectId = Integer.parseInt(idParam);
                ImTaches tachesDao = new ImTaches();
                ImpProjets dao = new ImpProjets();
                Projets NProjet = dao.getProjets(projectId);

                List<Taches> tachesAfaire = tachesDao.getTache("À faire", projectId);
                List<Taches> tachesEncours = tachesDao.getTache("En cours", projectId);
                List<Taches> tachesTerminer = tachesDao.getTache("Terminer", projectId);

                request.setAttribute("NProjet", NProjet);
                request.setAttribute("tachesAfaire", tachesAfaire);
                request.setAttribute("tachesEncours", tachesEncours);
                request.setAttribute("tachesTerminer", tachesTerminer);
        %>
<div class="rightside">
    <div class="TitrePjct">
        <p>${NProjet.nom}</p>
<input type="hidden" name="idProjets" value="${NProjet.id}" >
        
    </div>
    <div class="kanban">
    <div class="kanban-board">
        <div class="kanban-column">
            <div class="kanban-column-header">À faire</div>
             <button type="button" class="btn btnPosition ml-auto" data-toggle="modal" data-target="#addProjectModal">
                    +
                </button>
            <c:forEach var="tache" items="<%= tachesAfaire %>">
                <div class="kanban-item" draggable="true" data-id="${tache.id}">
                 <div class="kanban-content">
                    <div class="kanban-text">${tache.description}</div>
                    <div class="kanban-dates">
                        <span class="kanban-date">${tache.dateDebut}</span>
                        <span class="kanban-date">${tache.dateFin}</span>                        
                    </div>
                </div>
                <div class="kanban-buttons">
                    <div class="kanban-button">
                 <div class="button-content">
                 <form action="SupprimerTache?id=${tache.id}" method="post" class="ml-auto">
                <button type="submit" class="btn btnPositionremove ml-auto " data-toggle="modal" data-target="#deleteConfirmationModal">
                    -
                 </button>
                 </form></div>
                    </div>
                    <div class="kanban-button">
                  <div class="button-content">
                <form action="Ressources?id=${tache.id}" method="post" class="ml-auto">
                <button type="submit" class="btn btnPositionremove ml-auto " data-toggle="modal" data-target="#deleteConfirmationModal">
                  <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/9b1c17dddaf8b925e25ba42f643d4264f8238875/Media/Vector%20(3).svg" alt="Ressources">
                 </button></form></div>
                    </div>
                </div>
               </div>                
            </c:forEach>
           
        </div>
        <div class="kanban-column">
            <div class="kanban-column-header">En cours</div>
            <button type="button" class="btn btnPosition ml-auto " data-toggle="modal" data-target="#addProjectModal">
                    +
                </button>
            <c:forEach var="tache" items="<%= tachesEncours %>">
                <div class="kanban-item" draggable="true" data-id="${tache.id}">
                
                 <div class="kanban-content">
                    <div class="kanban-text">${tache.description}</div>
                    <div class="kanban-dates">
                        <span class="kanban-date">${tache.dateDebut}</span>
                        <span class="kanban-date">${tache.dateFin}</span>
                    </div>
                </div>
                <div class="kanban-buttons">
                    <div class="kanban-button">
                        <div class="button-content"><form action="SupprimerTache?id=${tache.id}" method="post" class="ml-auto">
                <button type="submit" class="btn btnPositionremove ml-auto " data-toggle="modal" data-target="#deleteConfirmationModal">
                    -
                 </button></form></div>
                    </div>
                    <div class="kanban-button">
                        <div class="button-content"><form action="Ressources?id=${tache.id}" method="post" class="ml-auto">
                <button type="submit" class="btn btnPositionremove ml-auto " data-toggle="modal" data-target="#deleteConfirmationModal">
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/9b1c17dddaf8b925e25ba42f643d4264f8238875/Media/Vector%20(3).svg" alt="Ressources">
                 </button></form></div>
                    </div>
                </div>
                </div>
            </c:forEach>
            
        </div>
        <div class="kanban-column">
            <div class="kanban-column-header">Terminer</div>
             <button type="button" class="btn btnPosition ml-auto " data-toggle="modal" data-target="#addProjectModal">
                   +
                </button>
            <c:forEach var="tache" items="<%= tachesTerminer %>">
                <div class="kanban-item" draggable="true" data-id="${tache.id}">
                 <div class="kanban-content">
                    <div class="kanban-text">${tache.description}</div>
                    <div class="kanban-dates">
                        <span class="kanban-date">${tache.dateDebut}</span>
                        <span class="kanban-date">${tache.dateFin}</span>
                    </div>
                </div>
                <div class="kanban-buttons">
                    <div class="kanban-button">
                        <div class="button-content"><form action="SupprimerTache?id=${tache.id}" method="post" class="ml-auto">
                <button type="submit" class="btn btnPositionremove ml-auto " data-toggle="modal" data-target="#deleteConfirmationModal">
                    -
                 </button></form></div>
                    </div>
                    <div class="kanban-button">
                        <div class="button-content"><form action="Ressources?id=${tache.id}" method="post" class="ml-auto">
                <button type="submit" class="btn btnPositionremove ml-auto " data-toggle="modal" data-target="#deleteConfirmationModal">
                  <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/9b1c17dddaf8b925e25ba42f643d4264f8238875/Media/Vector%20(3).svg" alt="Ressources">

                 </button></form></div>
                    </div>
                </div>
                </div>
                
            </c:forEach>
           
        </div>
    </div>
</div>
</div>




</div>
</main>

<!-- Modal Add-->
    <div class="modal fade" id="addProjectModal" tabindex="-1" aria-labelledby="addProjectModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="addTache" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProjectModalLabel">Ajouter une tâche</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                      <input type="hidden" class="form-control" id="id" name="id" value="${NProjet.id}" >
                        
                            <label for="projectDescription">Description</label>
                            <textarea class="form-control" id="projectDescription" name="description" rows="3" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="startDate">Date de début</label>
                            <input type="date" class="form-control" id="startDate" name="dateDebut" required>
                        </div>
                        <div class="form-group">
                            <label for="endDate">Date de fin</label>
                            <input type="date" class="form-control" id="endDate" name="dateFin" required>
                        </div>
                        <div class="form-group">
                            <label for="budget">Status</label>
                            <input list="StatusList" class="form-control" id="Status" name="Status" required>
						<datalist id="StatusList">
						  <option value="À faire">
						  <option value="En cours">
						  <option value="Terminer">
						</datalist>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="submit" class="btn button btn-primary">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <% 
           } 
%>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
  const items = document.querySelectorAll(".kanban-item");
const columns = document.querySelectorAll(".kanban-column");

items.forEach((item) => {
    item.addEventListener("dragstart", () => {
        item.classList.add("is-dragging");
    });
    item.addEventListener("dragend", () => {
        item.classList.remove("is-dragging");
    });
});

columns.forEach(column => {
    column.addEventListener('dragover', e => {
        e.preventDefault();
        const draggable = document.querySelector('.is-dragging');
        if (draggable) {
            column.appendChild(draggable);
        }
    });
});

items.forEach((item) => {
    item.addEventListener('click', function() {
        const itemId = item.getAttribute('data-id');
        window.location.href = 'modifierTacheForm?id='+ itemId;
    });
});

</script>
    
</body>
</html>
