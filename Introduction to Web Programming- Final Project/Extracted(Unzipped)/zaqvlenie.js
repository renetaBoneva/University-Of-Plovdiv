function Validate(){
		var name = document.getElementById('name').value;
		var city = document.getElementById('city').value;
		var work = document.getElementById('work').value;
		var phoneNumber = document.getElementById('phoneNumber').value;
		var email = document.getElementById('email').value;	
		var description = document.getElementById('description').value;

		if (name.length <= 1) {
			alert('Възникна проблем с името! Моля, проверете отново!');
			return false;
		}
		if (phoneNumber.length != 10 || phoneNumber == '') {
			alert('Възникна проблем с телефонния номер! Моля, проверете отново!');
			return false;
		}
		if (work.length <= 1 || work == '') {
			alert('Възникна проблем с поле "Занаят"! Моля, проверете отново!');
			return false;
		}
		if (city.length == 2  || city.length == 1) {
			alert('Моля, проверете отново поле "Област, град/село"!');
			return false;
		}
		
		if (email == ''){
		}
		else(email.indexOf('@') == -1 || email.indexOf('.') == -1) {
			alert('Възникна проблем с поле "Email"! Моля, проверете отново!');
			return false;
		}
	}
	function Validate1(){
		var name = document.getElementById('name1').value;
		var city = document.getElementById('city1').value;
		var phoneNumber = document.getElementById('phoneNumber1').value;
		var email = document.getElementById('email1').value;
		var owner = document.getElementById('owner1').value;		
		var description = document.getElementById('description1').value;

		if (name.length <= 1) {
			alert('Възникна проблем с името! Моля, проверете отново!');
			return false;
		}
		if (phoneNumber.length != 10 || phoneNumber == '') {
			alert('Възникна проблем с телефонния номер! Моля, проверете отново!');
			return false;
		}
		if (owner.length <= 1 || owner == '') {
			alert('Възникна проблем с поле "Ръководител"! Моля, проверете отново!');
			return false;
		}
		if (city.length == 2  || city.length == 1) {
			alert('Моля, проверете отново поле "Област, град/село"!');
			return false;
		}
		if (email == ''){
			//Problem ne raboti
		}
		else if (email.indexOf('@') == 0 || email.indexOf('.') == 0) {
			alert('Възникна проблем с поле "Email"! Моля, проверете отново!');
			return false;
		}
	}