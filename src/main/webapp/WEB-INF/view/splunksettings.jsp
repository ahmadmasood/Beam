<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Simple Dashboard</title>
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
                
                    <div class="body-nav body-nav-horizontal body-nav-fixed">
                        <div class="container">
                            <ul>
                                <li>
                                    <a href="dashboard.html">
                                        <i class="icon-dashboard icon-large"></i> Dashboard
                                    </a>
                                </li>
                                <li>
                                    <a href="splunksettings.html">
                                        <i class="icon-cogs icon-large"></i> Settings
                                    </a>
                                </li>

                                <li>
                                    <a href="${splunkUrl}">
                                        <i class="icon-bar-chart icon-large"></i> NetVistra
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                
 
    <section class="page container">
        <div class="row">
        
		    <table class="table table-striped" width="647">
		    <thead>
			    <tr>
			        <th>Index</th>
			        <th>SourceType</th>
			    </tr>
		    </thead>
		    <tbody>
		    <ul>  
		    <form:form id="indexSourceTypeListForm" method="POST" action="storeUserConfig" modelAttribute="indexSourceManager">
				<form:errors path="*" cssClass="errorblock" element="div" />
					<c:forEach var="indexSource" items="${indexSourceManager.indexSourceList}" varStatus="status">
						<tr>
						    <td><form:checkbox path="indexSourceList[${status.index}].selected" />							
							  ${indexSource.splunkIndex}
							</td>
							<td>${indexSource.sourceType}</td>
							<form:hidden path="indexSourceList[${status.index}].splunkIndex"/>
							<form:hidden path="indexSourceList[${status.index}].sourceType"/><BR>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3"><input type="submit" /></td>
					</tr>
			</form:form>
		    </tbody>
		    </table>

    </section>

    

            </div>
        </div>

        <div id="spinner" class="spinner" style="display:none;">
            Loading&hellip;
        </div>
 
       
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
        <script type="text/javascript">
        $(function() {
            $('#sample-table').tablesorter();
            $('#datepicker').datepicker();
            $(".chosen").chosen();
        });
    </script>

	</body>
</html>