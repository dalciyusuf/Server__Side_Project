<%@ Language="VBScript" %>
<%
Option Explicit
Response.CodePage = 65001
Response.Charset = "UTF-8"

Sub InitKitaplar()
    Dim kitaplar
    If IsEmpty(Application("kitaplar")) Then
        ReDim kitaplar(2)
        kitaplar(0) = "Sefiller;Victor Hugo;1862;Roman"
        kitaplar(1) = "Suc ve Ceza;Fyodor Dostoyevski;1866;Roman"
        kitaplar(2) = "Tutunamayanlar;Oguz Atay;1972;Roman"

        Application.Lock
        Application("kitaplar") = kitaplar
        Application.UnLock
    End If
End Sub

Call InitKitaplar()
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Library - Home</title>
</head>
<body>
    <h1>Library</h1>

    <form method="get" action="ara.asp">
        <label>Book name or author:</label><br>
        <input type="text" name="q">
        <input type="submit" value="Search">
    </form>

    <p>
        <a href="ekle.asp">Add New Book</a>
    </p>
</body>
</html>
