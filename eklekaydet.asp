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

Dim kitapadi, yazar, yil, tur
kitapadi = Trim(Request("kitapadi"))
yazar    = Trim(Request("yazar"))
yil      = Trim(Request("yil"))
tur      = Trim(Request("tur"))

If kitapadi = "" Then
    Response.Write "<p>Book name cannot be empty.</p><a href='ekle.asp'>Back</a>"
    Response.End
End If

If Len(yazar) < 4 Then
    Response.Write "<p>Author must be at least 4 characters.</p><a href='ekle.asp'>Back</a>"
    Response.End
End If

If Not IsNumeric(yil) Then
    Response.Write "<p>Year must be numeric.</p><a href='ekle.asp'>Back</a>"
    Response.End
End If

If CInt(yil) < 1950 Or CInt(yil) > 2025 Then
    Response.Write "<p>Year must be between 1950 and 2025.</p><a href='ekle.asp'>Back</a>"
    Response.End
End If

Dim kitaplar, newRecord, size
kitaplar = Application("kitaplar")
size = UBound(kitaplar) + 1

ReDim Preserve kitaplar(size)
newRecord = kitapadi & ";" & yazar & ";" & yil & ";" & tur
kitaplar(size) = newRecord

Application.Lock
Application("kitaplar") = kitaplar
Application.UnLock

Response.Redirect "ara.asp?q=" & Server.URLEncode(kitapadi)
%>
