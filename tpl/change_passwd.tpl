<div class="bgimg img-mountains">
    <div class="container">
        <form action="" id="psw-form" method="post">
		<input type="hidden" name="action" value="change_passwd">
		<label for="new-psw"><b>Новый пароль</b></label>
		<input type="password" class="use-margin"  placeholder="Введите пароль" id="new-psw" name="new_psw" pattern="(?=.*\d)(?=.*[a-zа-яё])(?=.*[A-ZА-ЯЁ]).{8,}" required>
		
		<label for="repeat-psw"><b>Повторите пароль</b></label>
		<input type="password" class="use-margin"  placeholder="Введите пароль" id="valid-psw" name="repeat_psw" required>
		
		<input type="submit" class="btn login" value="Сменить">
		
		<div id="message">
		<h3>Пароль должен содержать:</h3>
		<p id="letter"  class="invalid"><b>Прописные</b> кириллические или латинские буквы</p>
		<p id="capital" class="invalid"><b>Заглавные</b> кириллические или латинские буквы</p>
		<p id="number"  class="invalid"><b>Цифры</b></p>
		<p id="length"  class="invalid"><b>Минимум 8 символов</b></p>
		<p id="match"   class="invalid"><b>Пароли должны совпадать</b></p>
	</form>
    </div>
</div>

<script>
var myInput = document.getElementById("new-psw");
var Validate = document.getElementById("valid-psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");
var match = document.getElementById("match");

var form = document.getElementById("psw-form");

function validate() {
    if (myInput.value == Validate.value) {
        return true;
    }
    return false;
}

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
    document.getElementById("message").style.display = "block";
}
Validate.onfocus = function() {
    document.getElementById("message").style.display = "block";
}

form.onsubmit = function() {
  if (validate()) {
    return true;
  }

  return false;
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseEnglish = /[a-z]/g;
  var lowerCaseRussian = /[а-я]/g;
  if(myInput.value.match(lowerCaseEnglish) || myInput.value.match(lowerCaseRussian)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }

  // Validate capital letters
  var upperCaseEnglish = /[A-Z]/g;
  var upperCaseRussian = /[А-Я]/g;
  if(myInput.value.match(upperCaseEnglish) || myInput.value.match(upperCaseRussian)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }

  if (validate()) {
    match.classList.remove("invalid");
    match.classList.add("valid");
  } else {
    match.classList.remove("valid");
    match.classList.add("invalid");
  }
}

Validate.onkeyup = function() {
  if (validate()) {
    match.classList.remove("invalid");
    match.classList.add("valid");
  } else {
    match.classList.remove("valid");
    match.classList.add("invalid");
  }
}
</script>
