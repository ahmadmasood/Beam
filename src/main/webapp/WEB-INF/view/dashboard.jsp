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

        <div class="row">
            
            <div class="span16">
                <div class="row">
                    <div class="span8">
                        

<script type="text/javascript">
    google.load('visualization', '1', {'packages': ['corechart']});
    google.setOnLoadCallback(drawVisualization);
    
    function drawVisualization() {
        visualization_data = new google.visualization.DataTable();
        
        visualization_data.addColumn('string', 'Task');
        
        visualization_data.addColumn('number', 'Hours per Day');
        
        
        visualization_data.addRow(['MsExchange', 11]);
        
        visualization_data.addRow(['Windows', 2]);
        
        visualization_data.addRow(['Syslog', 2]);
        
        visualization_data.addRow(['NetApp', 2]);
        
        visualization_data.addRow(['SpoonBlade', 7]);
        
      
        visualization = new google.visualization.PieChart(document.getElementById('piechart'));
        visualization.draw(visualization_data, {title: 'Index Source Event Count', height: 260});       
    }
</script>

                        <div class="box">
                            <div class="box-header">
                                <i class="icon-bar-chart"></i>
                                <h5>Charts</h5>
                            </div>
                            <div class="box-content">
                                <div id="piechart"></div>
                            </div>
                        </div>
                    </div>
				  <div class="span8">
				                <div class="box">
				                    <div class="box-header">
				                        <i class="icon-bookmark"></i>
				                        <h5>Shortcuts</h5>
				                    </div>
				                    <div class="box-content">
				                        <div class="btn-group-box">
				                            <button class="btn"><a href="dashboard.html">
				                            <i class="icon-dashboard icon-large"></i>
				                            </a><br/>Dashboard</button>
				                            				                            
				                            <button class="btn"><a href="splunksettings.html">
				                            <i class="icon-cogs icon-large"></i></a>><br/>Settings</button>
				                            
				                            <button class="btn"><a href="${splunkUrl}">
				                            <i class="icon-bar-chart icon-large"></i></a><br/>NetVistra</button>
				                        </div>
				                    </div>
				                </div>
				            </div>
                  <div class="row">
                    <div class="span9">
                        <div class="box">
                            <div class="box-header">
                                <i class="icon-folder-open"></i>
                                <h5>Content</h5>
                            </div>
                            <div class="box-content">
                                <p>
								At Applied Network Solutions, Inc. (ANS), our mission is to provide the highest quality 
								information technology services to our customers. We commit to your success by building 
								the most reliable, efficient, and secure IT solutions to meet “your” requirements. Our 
								team of highly experienced IT professionals employs industry best practice methods to 
								deliver sound solutions that can satisfy all your requirements. Operations and Sustainment, 
								hardware or software, network communications or information security, ANS can provide assets 
								for the entire life cycle of your endeavor.
                                </p>
                                <p>
								ANS designs, engineers, and implements the most secure networks in the world for some of the 
								most demanding of clients. ANS is vendor agnostic, yet very vendor knowledgeable, with 
								certifications and experience on a wide-range of vendor solutions and products. Through working 
								in labs at our facility and at our client sites on business/mission oriented solutions, ANS is 
								established as a technology and thought leader with our clients. Notable efforts include 
								modernizing global client networks, transforming legacy WAN backbone to modern IP/MPLS based 
								architecture, and merging multiple disparate networks together. Our success has been noted on the 
								Inc. 5000 list of fastest growing companies.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="span7">
                        

<script type="text/javascript">
    google.load('visualization', '1', {'packages': ['corechart']});
    google.setOnLoadCallback(drawVisualization);
    
    function drawVisualization() {
        visualization_data = new google.visualization.DataTable();
        
        visualization_data.addColumn('string', 'Task');
        
        visualization_data.addColumn('number', 'Events');
        
        
        visualization_data.addRow(['Windows', 11]);
        
        visualization_data.addRow(['Cisco', 2]);
        
        visualization_data.addRow(['Netapp', 2]);
        
        visualization_data.addRow(['Syslog', 2]);
        
        visualization_data.addRow(['MsExchange', 7]);
        
      
        visualization = new google.visualization.ColumnChart(document.getElementById('barchart'));

       visualization.draw(visualization_data, {title: 'Index Event Count', height: 300});

        
    }
</script>
                        <div class="blockoff-left">
                            <div id="barchart"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 
    </section>

    

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