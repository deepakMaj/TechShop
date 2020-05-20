const cardName = document.getElementById('username');
const cardNumber = document.getElementById('cardNumber');
const cardMonth = document.getElementById('month');
const cardYear = document.getElementById('year');
const cardCvv = document.getElementById('cvv');

paymentConfirmation();

function paymentConfirmation(){
  document.getElementById('payment-form').addEventListener('submit', validCard);
}

function validCard(e){
  const date = new Date().getFullYear;
  e.preventDefault();
  if(cardName.type === 'number'){
    showError('Please enter valid card owner name');
  }
  if(cardNumber.type === 'string' || cardNumber != 16){
    showError('Please enter valid card number');
  }
  if(cardMonth.value > 12 || cardMonth.value < 1){
    showError('Please enter valid month');
  }
  if(cardYear.value < date){
    showError('Please enter valid year');
  }
  if(cardCvv.type === 'string' || cardCvv.value != 3){
    showError('Please enter valid Cvv number');
  }
  e.preventDefault();
}

function showError(error){
  const alert = document.createElement('div');
  alert.className = 'alert alert-danger';
  alert.appendChild(document.createTextNode(error));
  const container = document.querySelector('.container');
  const heading = document.querySelector('.login-heading');
  container.appendChild(alert, heading);
  setTimeout(clearError, 3000);
}

function clearError(){
  document.querySelector('.alert').remove();
}