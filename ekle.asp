<%@ Language="VBScript" %>
<%
Option Explicit
Response.CodePage = 65001
Response.Charset = "UTF-8"
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Add New Book</title>
</head>
<body>

<h1>Add New Book</h1>

<form method="post" action="eklekaydet.asp">

<p>
<label>Book Name:</label><br>
<input type="text" name="kitapadi" size="40">
</p>

<p>
<label>Author:</label><br>
<input type="text" name="yazar" size="40">
</p>

<p>
<label>Year (1950 - 2025):</label><br>
<input type="text" name="yil" size="10">
</p>

<p>
<label>Type:</label><br>
<input type="text" name="tur" size="30">
</p>

<p>
<input type="submit" value="Save">
<a href="index.asp">Cancel</a>
</p>

</form>

</body>
</html>
