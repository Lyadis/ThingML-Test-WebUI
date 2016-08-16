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
	  <li><a class="w3-dark-grey w3-padding-16" href="config.php">Configuration</a></li>
	  <li><a class="w3-padding-16" href="gitpull.html">Commandes</a></li>
	  <li><a class="w3-padding-16" href="results.html">Results</a></li>
	</ul>
  </div>
</header>




<div class="w3-container">

	 <?php
		if(isset($_POST['input_conf'])) {
			$writeconfig = fopen("../ThingML/testJar/config.properties", "w") or die("Unable to open file!");
			$inputconf = $_POST['input_conf'];
			fwrite($writeconfig, $inputconf);
			fclose($writeconfig);
		}
		
		$error_msg = "";
		$success_msg = "";
		//Compiler Jar Upload
		if (!empty($_FILES['compilerJar']['name'])) {
			$target_dir = "/app/ThingML/compilers/registry/target/";
			$target_compiler_file = $target_dir . "compilers.registry-0.7.0-SNAPSHOT-jar-with-dependencies.jar";
			$uploadOk = 1;
			$fileType = pathinfo(basename($_FILES["compilerJar"]["name"]),PATHINFO_EXTENSION);
			if(isset($_FILES["compilerJar"])) {
				// Allow certain file formats
				if($fileType != "jar") {
					$error_msg = $error_msg."Sorry, only jar files are allowed.<br />";
					$uploadOk = 0;
				}
				// Check if $uploadOk is set to 0 by an error
				if ($uploadOk == 0) {
					$error_msg = $error_msg."Sorry, your file was not uploaded.<br />";
				// if everything is ok, try to upload file
				} else {
					//echo " tmp: ".$_FILES["compilerJar"]["tmp_name"]." name: ".$target_compiler_file." ";
					$err = true;
					$err &= move_uploaded_file($_FILES["compilerJar"]["tmp_name"], $target_compiler_file);
					if ($err) {
						$success_msg = "<p>The file ". basename( $_FILES["compilerJar"]["name"]). " has been uploaded.</p>";
					} else {
						$error_msg = $error_msg."Sorry, there was an error uploading your file. (".$err.")<br />";
					}
				}
			}
		}
		//Test Jar Upload
		if (!empty($_FILES['testJar']['name'])) {
			$target_dir = "/app/ThingML/testJar/target/";
			$target_testJar_file = $target_dir . "testJar.registry-0.7.0-SNAPSHOT-jar-with-dependencies.jar";
			$uploadOk = 1;
			$fileType = pathinfo(basename($_FILES["testJar"]["name"]),PATHINFO_EXTENSION);
			if(isset($_FILES["testJar"])) {
				// Allow certain file formats
				if($fileType != "jar") {
					$error_msg = $error_msg."Sorry, only jar files are allowed.<br />";
					$uploadOk = 0;
				}
				// Check if $uploadOk is set to 0 by an error
				if ($uploadOk == 0) {
					$error_msg = $error_msg."Sorry, your file was not uploaded.<br />";
				// if everything is ok, try to upload file
				} else {
					//echo " tmp: ".$_FILES["compilerJar"]["tmp_name"]." name: ".$target_compiler_file." ";
					$err = true;
					$err &= move_uploaded_file($_FILES["testJar"]["tmp_name"], $target_testJar_file);
					if ($err) {
						$success_msg = $success_msg."<p>The file ". basename( $_FILES["testJar"]["name"]). " has been uploaded.</p>";
					} else {
						$error_msg = $error_msg."Sorry, there was an error uploading your file. (".$err.")<br />";
					}
				}
			}
		}
		
		
		if($success_msg != "") {
			echo '<hr><div class="w3-container" style="border-color: green; border-style: solid; border-width: 1px; color: green;">'.$success_msg.'</div>';
		}
		
		if($error_msg != "") {
			echo '<hr><div class="w3-container" style="border-color: red; border-style: solid; border-width: 1px; color: red;">'.$error_msg.'</div>';
		}
	?> 

	<hr>
	<h2 class="w3-center">Configuration</h2>
	<hr>
</div>

<div class="w3-row-padding">

	<div class="w3-half">
		<form class="w3-container w3-card-4" action="config.php" method="post" enctype="multipart/form-data"><center>
		<hr><div style="height:450px">
			<div class="box">
					<input type="file" name="compilerJar" id="compilerJar" class="inputfile inputfile-1" data-multiple-caption="{count} files selected" multiple />
					<label for="compilerJar">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17">
							<path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/>
						</svg>
						<span>Compiler Jar&hellip;</span>
					</label>
				</div><hr>
			<div class="box">
					<input type="file" name="testJar" id="testJar" class="inputfile inputfile-1" data-multiple-caption="{count} files selected" multiple />
					<label for="testJar">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17">
							<path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/>
						</svg>
						<span>Test Jar&hellip;</span>
					</label>
				</div><hr>
		</div><hr>
		<input type="submit" class="submit-button" value="Upload" />
		</center><hr></form>
	</div>

	<div class="w3-half">
		<form class="w3-container w3-card-4" action="config.php" method="post">
			<hr>
				 <?php
					$configfile = fopen("../ThingML/testJar/config.properties", "r") or die("Unable to open file!");
					echo '<textarea  style="width: 100%; height: 450px" name="input_conf">';
					echo fread($configfile,filesize("../ThingML/testJar/config.properties"));
					echo '</textarea>';
					fclose($configfile);
				?> 
			
			<hr>
			<center><input type="submit" class="submit-button" value="Upload" /></center>
			<hr>
		</form>
	</div>

</div>

<hr>




</body>
</html>

