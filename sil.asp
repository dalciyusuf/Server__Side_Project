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

Dim id, kitaplar, i, yeniDizi, eskiBoyut, yeniIndex
id = CInt(Request("id"))

kitaplar = Application("kitaplar")
eskiBoyut = UBound(kitaplar)

If id < 0 Or id > eskiBoyut Then
    Response.Write "<p>Gecersiz ID.</p><a href='index.asp'>Geri don</a>"
    Response.End
End If

If eskiBoyut = 0 Then
    ReDim yeniDizi(-1)
Else
    ReDim yeniDizi(eskiBoyut - 1)
    yeniIndex = 0

    For i = 0 To eskiBoyut
        If i <> id Then
            yeniDizi(yeniIndex) = kitaplar(i)
            yeniIndex = yeniIndex + 1
        End If
    Next
End If

Application.Lock
Application("kitaplar") = yeniDizi
Application.UnLock

Response.Redirect "ara.asp"
%>
