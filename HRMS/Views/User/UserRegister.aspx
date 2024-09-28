<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="HRMS.Views.User.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../../Scripts/jquery-3.7.0.js"></script>
    <script src="../../Scripts/jquery-3.7.0.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>

    <style>
        .gradient-custom {
            background: #f093fb;
            background: -webkit-linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1));
            background: linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1))
        }

        .card-registration .select-input.form-control[readonly]:not([disabled]) {
            font-size: 1rem;
            line-height: 2.15;
            padding-left: .75em;
            padding-right: .75em;
        }

        .card-registration .select-arrow {
            top: 13px;
        }
    </style>
</head>
<body>
    <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
            <form>

              <div class="row">
                <div class="col-md-6 mb-4">

                  <div data-mdb-input-init class="form-outline">
                    <input type="text" id="firstName" class="form-control form-control-lg" />
                    <label class="form-label" for="firstName">First Name</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                  <div data-mdb-input-init class="form-outline">
                    <input type="text" id="lastName" class="form-control form-control-lg" />
                    <label class="form-label" for="lastName">Last Name</label>
                  </div>

                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 d-flex align-items-center">

                  <div data-mdb-input-init class="form-outline datepicker w-100">
                    <input type="date" class="form-control form-control-lg" id="birthdayDate" />
                    <label for="birthdayDate" class="form-label">Birthday</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                  <h6 class="mb-2 pb-1">Gender: </h6>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="femaleGender"
                      value="2" />
                    <label class="form-check-label" for="femaleGender">Female</label>
                  </div>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="maleGender"
                      value="1" />
                    <label class="form-check-label" for="maleGender">Male</label>
                  </div>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="otherGender"
                      value="3" />
                    <label class="form-check-label" for="otherGender">Other</label>
                  </div>

                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 pb-2">

                  <div data-mdb-input-init class="form-outline">
                    <input type="email" id="emailAddress" class="form-control form-control-lg" />
                    <label class="form-label" for="emailAddress">Email</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4 pb-2">

                  <div data-mdb-input-init class="form-outline">
                    <input type="tel" id="phoneNumber" class="form-control form-control-lg" />
                    <label class="form-label" for="phoneNumber">Phone Number</label>
                  </div>

                </div>
              </div>

              <div class="row">
                  <div class="col-md-6 mb-4">
                      <label class="form-label" for="password">Password</label>
                      <input type="text" id="password" oninput="IsPasswordMatch()" class="form-control form-control-lg" />
                  </div>
                  <div class="col-md-6 mb-4">
                      <label class="form-label" for="cnfpassword">Confirm Password</label>
                      <input type="text" id="cnfpassword" oninput="IsPasswordMatch()" class="form-control form-control-lg" />
                  </div>
                  <div class="col-12">
                      <strong id="isPassMatch" class="text-danger"></strong>
                  </div>
              </div>
              <div class="mt-4 pt-2">
                <input data-mdb-ripple-init class="btn btn-primary btn-lg" type="button" onclick="Register()" value="Submit" />
                  <span class="small">Already have an account? <a href="/" class="text-danger">Login</a></span>
              </div>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
    <script type="text/javascript">
        var isPassMatch = false;
        function IsPasswordMatch() {
            if ($("#password").val() !== $("#cnfpassword").val()) {
                isPassMatch = false;
                $("#isPassMatch").html('<span>Password does not match</span>');
            } else {
                isPassMatch = true;
                $("#isPassMatch").empty();
            }
        }

        function Clear() {
            $("#firstName").val(""),
                $("#lastName").val(""),
                $("#birthdayDate").val(""),
                $('input[name="inlineRadioOptions"]').prop('checked', false);
            $("#emailAddress").val(""),
                $("#phoneNumber").val(""),
                $("#password").val(""),
                $("#cnfpassword").val("")
        }


        function Register() {
            if (!isPassMatch) return;
            let dataVal = {
                firstName: $("#firstName").val(),
                lastName: $("#lastName").val(),
                dob: $("#birthdayDate").val(),
                gender: $('input[name="inlineRadioOptions"]:checked').val(),
                email: $("#emailAddress").val(),
                phone: $("#phoneNumber").val(),
                password: $("#password").val()
            };
            console.log(dataVal);
            $.ajax({
                url: 'SubmitUser',
                type: 'post',
                data: dataVal,
                success: function (response) {
                    console.log(response);
                    if (response.success) {
                        Swal.fire({
                            title: "Signup",
                            text: response.message,
                            icon: "success"
                        });
                        Clear();
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Oops...",
                            text: response.message,

                        });
                    }

                },
                error: function () {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Something went wrong!",

                    });
                }
            })
        }
    </script>
</html>
