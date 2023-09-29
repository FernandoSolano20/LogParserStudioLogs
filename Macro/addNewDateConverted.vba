Function ConvertDateTimeToTimeZone(dateTime As Date, timeZoneOffset As Double) As Date
    Dim adjustedDateTime As Date
    
    ' Adjust the date-time value based on the time zone offset
    adjustedDateTime = dateTime + TimeSerial(Int(timeZoneOffset), 0, 0) + TimeSerial(0, 0, (timeZoneOffset - Int(timeZoneOffset)) * 60)
    
    ' Return the adjusted date-time
    ConvertDateTimeToTimeZone = adjustedDateTime
End Function

Sub AddAndPopulateNewColumn()
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim inputDateTimeStr As String
    Dim timeZoneOffset As Double
    Dim i As Long
    
    
    ' Set the worksheet where you want to add and populate the new column
    Set ws = ThisWorkbook.Sheets(ThisWorkbook.Sheets(1).Name) ' Change "Sheet1" to your sheet name
    
    ' Find the last used row in column A
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    
    ' Set the time zone offset (e.g., -5 for UTC -5)
    timeZoneOffset = -5
    
    ' Insert a new column between columns A and B
    ws.Columns("B:B").Insert Shift:=xlToRight, CopyOrigin:=xlFormatFromLeftOrAbove
    ws.Cells(1, "B").Value = "Austin Time"
    ' Loop through each cell in column A and populate the new column (B) with converted values
    For i = 2 To lastRow
        inputDateTimeStr = ws.Cells(i, "A").Value
        
        ' Convert the input date-time string to a Date value
        Dim inputDateTime As Date
        On Error Resume Next
        inputDateTime = CDate(Replace(inputDateTimeStr, "-", " "))
        On Error GoTo 0
        
        ' Call the ConvertDateTimeToTimeZone function to get the adjusted date-time
        Dim adjustedDateTime As Date
        adjustedDateTime = ConvertDateTimeToTimeZone(inputDateTime, timeZoneOffset)
            
        
        ws.Cells(i, "B").Value = Format(adjustedDateTime, "MM/dd/yyyy-hh:mm:ss")
    Next i
End Sub

