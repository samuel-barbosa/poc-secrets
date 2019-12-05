<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.nio.file.*.*" %>
<!DOCTYPE html>
<html>
<body>
	<h1>News Feed Demo</h1>
<%
        String apiKey = new String(Files.readAllBytes("/secrets/api.key"));
        URL url = new URL(String.format("https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=%s", apiKey));
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setDoOutput(true);

        int status = con.getResponseCode();

        out.print("<h3>HTTP Response Code: <em>" + status + " " + con.getResponseMessage()
                + "</em></h3><hr><textarea rows='15' cols='40'>");

        if (status == 200) 
        {
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) 
            {
                out.print(inputLine);
            }
            in.close();
        }
        out.print("</textarea>");

%>
</body>

</html>
