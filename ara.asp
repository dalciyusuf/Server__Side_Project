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

Dim q, qClean, kitaplar, i, info, ad, yazar, yil, tur
q = Trim(Request("q"))
qClean = Replace(q, "'", "")

kitaplar = Application("kitaplar")
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Search Results</title>
</head>
<body>
    <h1>Search Results</h1>

    <form method="get" action="ara.asp">
        <label>Book name or author:</label><br>
        <input type="text" name="q" value="<%=Server.HTMLEncode(q)%>">
        <input type="submit" value="Search">
    </form>

    <p><a href="index.asp">Home</a> | <a href="ekle.asp">Add New Book</a></p>

<%
Dim found
found = False

If IsArray(kitaplar) Then
%>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Book</th>
        <th>Author</th>
        <th>Year</th>
        <th>Type</th>
        <th>Actions</th>
    </tr>

<%
    For i = 0 To UBound(kitaplar)
        info = Split(kitaplar(i), ";")
        ad   = info(0)
        yazar = info(1)
        yil   = info(2)
        tur   = info(3)

        If qClean = "" _
           Or Instr(LCase(ad), LCase(qClean)) > 0 _
           Or Instr(LCase(yazar), LCase(qClean)) > 0 Then

            found = True
%>

    <tr>
        <td><a href="detay.asp?id=<%=i%>"><%=ad%></a></td>
        <td><%=yazar%></td>
        <td><%=yil%></td>
        <td><%=tur%></td>

        <td>
            <a href="detay.asp?id=<%=i%>">Detail</a> |
            <a href="sil.asp?id=<%=i%>&q=<%=Server.URLEncode(q)%>"
               onclick="return confirm('Are you sure?');">Delete</a>
        </td>
    </tr>

<%
        End If
    Next
%>
</table>

<%
    If Not found Then
        Response.Write "<p>No books found.</p>"
    End If
Else
    Response.Write "<p>No books in library yet.</p>"
End If
%>

</body>
</html>
