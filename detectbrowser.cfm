
<!---<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!---<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>

   <script src="js.device.detector-master/js.device.detector-master/dist/jquery.device.detector.js"></script>--->

  </head>
  <body>
  <cfhttp url="https://www.googleapis.com/youtube/v3/videos?part=snippet&id=L3L64rf_pow&key=AIzaSyDXZR4n0oo8TjiiTBnxIBi5fF7Qh8rjbrU" method="get">
    <cfhttpparam type="header" name="Accept" value="application/json">
  </cfhttp>

  <cfset response = cfhttp.filecontent>
  <cfset videoData = deserializeJSON(response)>
  <cfdump  var="#videoData#">
<cfoutput>
    Video Title: #videoData.items[1].snippet.title#<br>
    Description: #videoData.items[1].snippet.description#<br>
    Published At: #videoData.items[1].snippet.publishedAt#<br>
</cfoutput>


<cfparam name="form.searchQuery" default="">
<cfset apiKey = "YOUR_API_KEY">

<!--- Construct the API request URL --->
<cfset apiUrl = "https://www.googleapis.com/youtube/v3/search">
<cfset apiUrl = apiUrl & "?part=id&type=video&maxResults=1&q=#encodeForURL(form.searchQuery)#&key=#apiKey#">

<!--- Send the API request using cfhttp --->
<cfhttp url="#apiUrl#" method="GET" result="response">
    <cfhttpparam type="header" name="Accept" value="application/json">
</cfhttp>

<!--- Parse the API response --->
<cfset responseData = deserializeJSON(response.filecontent)>

<!--- Extract the VIDEO_ID from the response --->
<cfset videoId = responseData.items[1].id.videoId>

<!--- Display the VIDEO_ID or embed the video --->
<cfoutput>
    <h2>VIDEO_ID: #videoId#</h2>
    <iframe width="560" height="315" src="https://www.youtube.com/embed/#videoId#" frameborder="0" allowfullscreen></iframe>
</cfoutput>


  </body>
</html>--->

<!DOCTYPE html>
<html>
<head>
    <title>YouTube Video Search</title>
</head>
<body>
    <form id="searchForm">
        <input type="text" id="searchQuery" placeholder="Enter search query">
        <button type="button" onclick="searchVideo()">Search</button>
    </form>

    <div id="videoPlayer"></div>

    <script>
        function searchVideo() {
            var searchQuery = document.getElementById("searchQuery").value;
            var apiKey = "AIzaSyDXZR4n0oo8TjiiTBnxIBi5fF7Qh8rjbrU";
            var apiUrl = "https://www.googleapis.com/youtube/v3/search?part=id&type=video&maxResults=1&q=" + encodeURIComponent(searchQuery) + "&key=" + apiKey;

            // Send the API request
            fetch(apiUrl)
                .then(response => response.json())
                .then(data => {
                    var videoId = data.items[0].id.videoId;
                    var embedUrl = "https://www.youtube.com/embed/" + videoId;

                    // Embed the video
                    var videoPlayer = document.getElementById("videoPlayer");
                    videoPlayer.innerHTML = '<iframe width="560" height="315" src="' + embedUrl + '" frameborder="0" allowfullscreen></iframe>';
                })
                .catch(error => {
                    console.log(error);
                });
        }
    </script>
</body>
</html>