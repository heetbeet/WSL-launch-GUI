'*************************************************
' Run the run_app.bat file silently
'*************************************************

'adapted from http://superuser.com/questions/140047/how-to-run-a-batch-file-without-launching-a-command-window/390129
ScriptFullPath = Wscript.ScriptFullName
ScriptName = Wscript.ScriptName
Path = Mid(ScriptFullPath, 1, Len(ScriptFullPath)-Len(ScriptName))

'Generate the following command
'"$Path\run_app.bat" "arg1" "arg2" "arg3" ...
RunCmd = chr(34) & Path & "bashx-console.bat" & chr(34) 
If WScript.Arguments.Count >= 1 Then
    For i = 0 To WScript.Arguments.Count-1
        Arg = WScript.Arguments(i)
        If InStr(Arg, " ") > 0 Then Arg = chr(34) & Arg & chr(34)
        RunCmd = RunCmd & " " & Arg
    Next
End If

'MsgBox(RunCmd)
CreateObject("Wscript.Shell").Run RunCmd, 0 , True