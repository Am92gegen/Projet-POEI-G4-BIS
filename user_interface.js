function getReport(){
    let id_vehicle =  document.getElementById("id_vehicle").value;
    //let regexNom = /^[a-zA-Z]{1,50}$/;
    let action_src = "http://localhost:5000/report/" + id_vehicle;
    let form = document.getElementById('form');
    form.action = action_src ;
}