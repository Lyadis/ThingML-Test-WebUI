<!DOCTYPE html>
<html class="js">
<head>
	<title>ThingML Cloud Test UI</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-black.css">
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<script src="js/custom-file-input.js"></script>

	<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
</head>

<body>

<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
  <div class="w3-center">
  <h1 class="w3-xxxlarge">ThingML Cloud Tests</h1>

	<ul class="w3-navbar w3-theme">
	  <li><a class="w3-padding-16" href="config.php">Configuration</a></li>
	  <li><a class="w3-padding-16" href="gitpull.php">Git Pull</a></li>
	  <li><a class="w3-dark-grey w3-padding-16" href="runtests.php">Run Tests</a></li>
	  <li><a class="w3-padding-16" href="results.html">Results</a></li>
	</ul>
  </div>
</header>




<div class="w3-container">
	<hr>
	<h2 class="w3-center">Git Pull</h2>
	<hr>
</div>

<div class="w3-row-padding">

	

	<div class="w3-container w3-card-4">
		<hr>
			<?php
				$cmd_prefix = "sshpass -p 'screencast' ssh -o StrictHostKeyChecking=no -p 44444 root@196.168.1.6 ";
				$cmd1 = $cmd_prefix."/thingml/ThingML/run_tests.sh";
				//exec('(ping -c 20 127.0.0.1 > /app/web/gitPullRes 2>&1)&');
				echo $cmd1."<br />";
				exec("(".$cmd1.")&");
			?>
		<hr>
		<iframe id="cmd-results" name="cmd-results" src="run_tests_log" style="width: 100%; height: 500px"></iframe>
		<hr>
	</div>
</div>

<hr>



<script>


var iframe = document.getElementById('cmd-results');


function reloadIFrame() {
	iframe.src = iframe.src;
	iframe.scrollTop = elem.scrollHeight;
}

window.setInterval("reloadIFrame();", 2000);
</script>


</body>

</html>

