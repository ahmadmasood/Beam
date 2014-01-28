<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>NetVistra Beam</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <meta name="layout" content="main"/>
    
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>

    <script src="resources/js/jquery/jquery-1.8.2.min.js" type="text/javascript" ></script>
    <link href="resources/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />

    <style>
    </style>
</head>
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button class="btn btn-navbar" data-toggle="collapse" data-target="#app-nav-top-bar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="dashboard.html" class="brand"><i class="icon-leaf">NetVistra Beam</i></a>
                        <ul class="nav pull-right">
                            <li>
                                <a href="login.html">Logout</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="body-container">
                    <div id="body-content">
                        
                        
            <div class='container'>
                
                <div class="signin-row row">
                    <div class="span4"></div>
                    <div class="span8">
                        <div class="container-signin">
                            <legend>Please Login</legend>
                            <form action='dashboard.html' method='POST' id='loginForm' class='form-signin' autocomplete='off'>
                                <div class="form-inner">
                                    <div class="input-prepend">
                                        
                                        <span class="add-on" rel="tooltip" title="Username or E-Mail Address" data-placement="top"><i class="icon-envelope"></i></span>
                                        <input type='text' class='span4' id='username'/>
                                    </div>

                                    <div class="input-prepend">
                                        
                                        <span class="add-on"><i class="icon-key"></i></span>
                                        <input type='password' class='span4' id='password'/>
                                    </div>
                                    <label class="checkbox" for='remember_me'>Remember me
                                        <input type='checkbox' id='remember_me'
                                               />
                                    </label>
                                </div>
                                <footer class="signin-actions">
                                    <input class="btn btn-primary" type='submit' id="submit" value='Login'/>
                                </footer>
                            </form>
                        </div>
                    </div>
                    <div class="span3"></div>
                </div>
           </div>
            </div>
        </div>

        <div id="spinner" class="spinner" style="display:none;">
            Loading&hellip;
        </div>

        <footer class="application-footer">
            <div class="container">
                <p>Application Footer</p>
                <div class="disclaimer">
                    <p>Spoonblade.</p>
                </div>
            </div>
        </footer>
        <script type="text/javascript">
            $(function(){
                document.forms['loginForm'].elements['j_username'].focus();
                $('body').addClass('pattern pattern-sandstone');
                $("[rel=tooltip]").tooltip();
            });
        </script>
        <script src="resources/js/bootstrap/bootstrap-transition.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-alert.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-modal.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-dropdown.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-scrollspy.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-tab.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-tooltip.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-popover.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-button.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-collapse.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-carousel.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-typeahead.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-affix.js" type="text/javascript" ></script>
        <script src="resources/js/bootstrap/bootstrap-datepicker.js" type="text/javascript" ></script>
        <script src="resources/js/jquery/jquery-tablesorter.js" type="text/javascript" ></script>
        <script src="resources/js/jquery/jquery-chosen.js" type="text/javascript" ></script>
        <script src="resources/js/jquery/virtual-tour.js" type="text/javascript" ></script>
        

	</body>
</html>