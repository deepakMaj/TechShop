document.getElementById('name').addEventListener('blur', validateName);
document.getElementById('card').addEventListener('blur', validateCard);
document.getElementById('month').addEventListener('blur', validateMonth);
document.getElementById('year').addEventListener('blur', validateYear);
document.getElementById('cvv').addEventListener('blur', validateCvv);

function validateName(){
	const name = document.getElementById('name');
	const re = /^[A-Za-z]{4,20}$/;
	if(!re.test(name.value)){
		name.classList.add('is-invalid');
	}
	else{
		name.classList.remove('is-invalid');
	}
}

function validateCard(){
	const card = document.getElementById('card');
	const re = /^[1-9][0-9]{3}\-[0-9]{4}\-[0-9]{4}\-[0-9]{4}$/;
	if(!re.test(card.value)){
		card.classList.add('is-invalid');
	}
	else{
		card.classList.remove('is-invalid');
	}
}

function validateMonth(){
	const month = document.getElementById('month');
	const re = /^[0-1][1-9]$/;
	if(!re.test(month.value)){
		console.log('Error');
		month.classList.add('is-invalid');
	}
	else{
		month.classList.remove('is-invalid');
	}
}

function validateYear(){
	const year = document.getElementById('year');
	const date = new Date();
	const re = /^2[0-9]{3}$/;
	if(!(parseInt(year.value) >= date.getFullYear() && re.test(year.value))){
		year.classList.add('is-invalid');
	}
	else{
		year.classList.remove('is-invalid');
	}
}

function validateCvv(){
	const cvv = document.getElementById('cvv');
	const re = /^[1-9][0-9]{2}$/;
	if(!re.test(cvv.value)){
		cvv.classList.add('is-invalid');
	}
	else{
		cvv.classList.remove('is-invalid');
	}
}