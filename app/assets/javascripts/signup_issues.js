function attachListeners() {
    $(".submit-1").on('click', function(e){
        e.preventDefault();
        alert('WHOA!')
    })
}

attachListeners();