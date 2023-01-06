let logoImg = document.getElementById("logo");
let ul = document.getElementById('ul');
let viewport_width = document.documentElement.clientWidth;

logoImg.addEventListener('click', handleNav)
if(viewport_width <= 600) {
    ul.style.display = "none";
    document.querySelector('header').style.paddingTop = '0px';
    document.querySelector('h1').style.marginTop = "50px";
}

function handleNav(event){
	event.preventDefault();
    if(viewport_width <= 600) {
        if (ul.style.display == "none"){
            ul.style.display = "flex";
            document.querySelector('header').style.paddingTop = '80px';
            document.querySelector('h1').style.marginTop = "300px";
        } else {
            ul.style.display = "none";		
            document.querySelector('header').style.paddingTop = '0px';
            document.querySelector('h1').style.marginTop = "50px";
        }
    }
}

let comForm = document.querySelector('form')
comForm.addEventListener('submit', handleSubmit)
let comValue = document.querySelector('div#activeCom p.comValue');
let comName = document.querySelector('div#activeCom p.name');

function handleSubmit(event){
    event.preventDefault();
    let form = new FormData(comForm);

    let name = form.get('name');
    let value = form.get('inputCom');

    if(name == ""){
        return alert('Моля, попълнете полето за Вашето име!')
    } else if(value == ""){
        return alert('Моля, попълнете полето за Вашия коментар!')
    }

    if(value.length > 260) {
        comValue.textContent = value.substring(0,260) + "...";
    } else {
        comValue.textContent = value;
    }    

    if(name.length >= 30){
        let nameArr = name.split(' ');        
        comName.textContent = nameArr[0];

    } else {
        comName.textContent = name;
    }
    comForm.reset();
}