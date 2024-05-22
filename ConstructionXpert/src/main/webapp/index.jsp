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
            height: 100%;
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
            flex: 1;
            width: 90%;
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
        .projet.active{
            background-color: rgba(255, 118, 41, 0.57);
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
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <ul class="nav">
            <li class="nav-item ">
                <div class="box"></div>
                <a class="nav-link" href="">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector.svg" alt="Home">
                </a>
            </li>
            <li class="nav-item ">
                <div class="box"></div>
                <a class="nav-link" href="/projets.html">      
                    <img src="https://raw.githubusercontent.com/THSK4U/ConstructionXpert-/6398607f40c5d44b48dad6606b7b3779cda22829/Media/Vector%20(1).svg" alt="Projets">
                </a>
            </li>
            <li class="nav-item active">
                <div class="box"></div>
                <a class="nav-link" href="">      
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
<div class="projet active">
    test
</div>
<div class="projet ">
    test
</div>
    </div>
</div>
<div class="rightside">
    <div class="TitrePjct">
        <p>Projets Nom </p>
    </div>
    <div class="kanban">
    <div class="kanban-board">
        <div class="kanban-column">
            <div class="kanban-column-header" >À faire</div>
            <div class="kanban-item"draggable="true"> 1</div>
            <div class="kanban-item"draggable="true"> 2</div>
        </div>
        <div class="kanban-column">
            <div class="kanban-column-header">En cours</div>
            <div class="kanban-item"draggable="true"> 3</div>
            <div class="kanban-item"draggable="true"> 4</div>
        </div>
        <div class="kanban-column">
            <div class="kanban-column-header">Terminer</div>
            <div class="kanban-item"draggable="true"> 5</div>
        </div>
    </div>
</div>
</div>
</div>

</main>
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
        window.location.href = 'test';
    });
});
</script>
    
</body>
</html>
