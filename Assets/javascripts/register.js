$(document).ready(function () {
    $('section.new-user-wrapper #aspnetForm').validate({
        rules: {
            "ctl00$bodyContent$firstNameTxt": "required",
            "ctl00$bodyContent$lastNameTxt": "required",
            "ctl00$bodyContent$lastNameTxt": "required",
            "ctl00$bodyContent$emailTxt": {
                "required": true,
                "email": true
            },
            "ctl00$bodyContent$usernameTxt": "required",
            "ctl00$bodyContent$passwordTxt": {
                required: true,
                minlength: 5
            },
            "ctl00$bodyContent$confirmPasswordTxt": {
                required: true
            },
            "ctl00$bodyContent$addressTxt": "required",
            "ctl00$bodyContent$mobileNumTxt": "required"
        }
    });
});