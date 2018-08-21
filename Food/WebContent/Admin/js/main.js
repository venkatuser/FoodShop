window.onscroll =function() {headfix()};

var header=document.getElementById('myNav');
var fix=header.offsetTop;

function headfix(){
	if(window.pageYOffset>fix){
		header.classList.add("fix");
		header.style="box-shadow: 0px 10px 50px; transition: 0.3s;";
	}
	else{
		header.classList.remove("fix");
		header.style="box-shadow: 0px 0px 0px; transition: 0.8s; ";
		
	}
}
// Table Search
function search(inputval,tablename) {
  var input, filter, table, tr, td, i;
  input = document.getElementById(inputval);
  filter = input.value.toUpperCase();
  table = document.getElementById(tablename);
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
