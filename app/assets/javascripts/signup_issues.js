function attachListeners() {
    $(".submit-1").on('click', function(e){
        e.preventDefault();
        let myForm = document.getElementById('member_info_form')
        let formData = new FormData(myForm)

        return fetch('/members', {
            credentials: "include",
            method: "POST",
            body: formData
        })
        .then(resp => resp.json())
        .then(member =>{
            document.querySelector('h2').innerText = `Registration Success! Welcome, ${member.name}`
            document.getElementById('member_issues_section').action = `/members/${member.id}`
            document.getElementById('form-part-2').style.display = "block"
        })
    })
}

attachListeners();