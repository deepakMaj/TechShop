const cardName = document.getElementById('username');
const cardNumber = document.getElementById('cardNumber');
const cardMonth = document.getElementById('month');
const cardYear = document.getElementById('year');
const cardCvv = document.getElementById('cvv');

paymentConfirmation();

function paymentConfirmation(){
  document.getElementById('btn').addEventListener('click', validCard);
}

function validCard(e){
  const date = new Date().getFullYear;
  if(cardName.type === 'number'){
    showError('Please enter valid card owner name');
    e.preventDefault();
  }
  if(cardNumber.type === 'string' || cardNumber.value.toString().length != 16){
    showError('Please enter valid card number');
    e.preventDefault();
  }
  if(cardMonth.value > 12 || cardMonth.value < 1){
    showError('Please enter valid month');
    e.preventDefault();
  }
  if(cardYear.value.toString().length < date){
    showError('Please enter valid year');
    e.preventDefault();
  }
  if(cardCvv.type === 'string' || cardCvv.value.toString().length != 3){
    showError('Please enter valid Cvv number');
    e.preventDefault();
  }
}

function showError(error){
  const alert = document.createElement('div');
  alert.className = 'alert alert-danger';
  alert.appendChild(document.createTextNode(error));
  const container = document.querySelector('.container');
  const heading = document.querySelector('.login-heading');
  container.insertBefore(alert, heading);
  setTimeout(clearError, 5000);
}

function clearError(){
  document.querySelector('.alert').remove();
}