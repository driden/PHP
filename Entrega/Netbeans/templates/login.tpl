<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.js"></script>

        <link href="./css/header.css" rel="stylesheet" type="text/css">
        <script src="./js/login.js" type="text/javascript"></script>
        <link href="./css/register.css" rel="stylesheet" type="text/css"></head>

    <body>
        {include file="Header.tpl"}

        <div class="col-md-4 col-md-offset-4">
            
            <form id="user-form" class="example" method="POST" action="login.php">
                <div class="row"><h2 class="banner">Login</h2> </div>
                <div class="row">
                    <div class="form-group has-feedback">
                        <label class="control-label" for="email">Email</label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="Your email address">
                        <span class="form-control-feedback glyphicon glyphicon-ok"></span>
                    </div>
                </div>
                        
                <!-- Password -->
                <div class="row">
                    <div class="form-group has-feedback">
                        <label class="control-label" for="password">Contraseña</label>
                        <input type="password" class="form-control" name="password" id="password">
                        <span class="form-control-feedback glyphicon glyphicon-ok"></span>
                    </div>
                </div>
                
                <div class="row">
                    <button type="submit">Iniciar sesión</button>
                </div>
            </form>
        </div>
    </body>

</html>