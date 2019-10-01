function attachListeners() {
    $(".submit-1").on('click', function(e){
        e.preventDefault();
        let myForm = document.getElementById('member_info_form')
        let formData = new FormData(myForm)

        return fetch('http://localhost:3000/members', {
            credentials: "include",
            method: "POST",
            body: formData
        })
        .then(()=>{
            document.getElementById('form-part-2').style.display = "block"
        })
    })
}

attachListeners();