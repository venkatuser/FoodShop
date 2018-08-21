window.onscroll=function(){navshad()}
nav=document.getElementById('MainNav');

lstsr=0;
function navshad(){

	st=window.pageYOffset;
	if(st>lstsr){

		nav.classList.remove("sd");	
		nav.classList.add("notfad");
		nav.classList.remove("fad");
		
	}
	else{
		
		nav.classList.add("sd");
		nav.classList.add("fad");	
	}
	lstsr=st<=0?0:st;


	// if(window.pageYOffset>=50){
	// 	nav.classList.add("sd");
	// }else{
	// 	nav.classList.remove("sd");	
	// }
}

function navoc() {
    var x = document.getElementById("l");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}


//Get the modal
var modal = document.getElementById('myModal');

//Get the button that opens the modal
var btn = document.getElementById("myBtn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks the button, open the modal 
btn.onclick = function() {
 modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span.onclick = function() {
 modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
 if (event.target == modal) {
     modal.style.display = "none";
 }
}


