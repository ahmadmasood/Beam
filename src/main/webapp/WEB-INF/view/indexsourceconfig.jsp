<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Netvistra</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/netvistra.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.png" />
    <script type="text/javascript" src="resources/js/d3/d3.min.js"></script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

	<style>
	.error {
		color: #ff0000;
	}
	 
	.errorblock {
		color: #000;
		background-color: #ffEEEE;
		border: 3px solid #ff0000;
		padding: 8px;
		margin: 16px;
	}
	</style>
  </head>
  <body>
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="navbar-netvistra-header">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <img src="images/nv2_logo_deployment.png" />
          </div>
          <div class="navbar-collapse collapse">
            <form class="navbar-form navbar-right" role="form">
              <div class="form-group">
                <input type="text" placeholder="Email" class="form-control">
              </div>
              <div class="form-group">
                <input type="password" placeholder="Password" class="form-control">
              </div>
              <button type="submit" class="btn btn-success">Sign in</button>
            </form>
          </div><!--/.navbar-collapse -->
        </div>
      </div>
      <div class="navbar-netvistra-nav">
        <div class="container">
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="#">Item 1</a></li>
              <li><a href="#">Item 2</a></li>
              <li><a href="#">Item 3</a></li>
              <li><a href="#">Item 4</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="netvistra-panel">
            <h1>Hello World!</h1>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6"><div class="netvistra-panel">Col 1</div></div>
        <div class="col-lg-6"><div class="netvistra-panel">Col 2</div></div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="netvistra-panel">
            <h1>More stuff</h1>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="netvistra-panel">
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
          </div>
        </div>
      </div>      
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="resources/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
  </body>
</html>

