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

Dim id, kitaplar, info, ad, yazar, yil, tur

id = CInt(Request("id"))
kitaplar = Application("kitaplar")

If id < 0 Or id > UBound(kitaplar) Then
    Response.Write "<p>Invalid book ID.</p>"
    Response.End
End If

info = Split(kitaplar(id), ";")
ad   = info(0)
yazar = info(1)
yil   = info(2)
tur   = info(3)
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Book Detail</title>
</head>
<body>

<h1>Book Detail</h1>

<table border="1" cellpadding="5" cellspacing="0">
    <tr><th>Book</th><td><%=ad%></td></tr>
    <tr><th>Author</th><td><%=yazar%></td></tr>
    <tr><th>Year</th><td><%=yil%></td></tr>
    <tr><th>Type</th><td><%=tur%></td></tr>
</table>

<p>
    <a href="index.asp">Home</a> |
    <a href="ara.asp?q=">Search</a> |
    <a href="sil.asp?id=<%=id%>"
       onclick="return confirm('Delete this book?');">Delete</a>
</p>

</body>
</html>
