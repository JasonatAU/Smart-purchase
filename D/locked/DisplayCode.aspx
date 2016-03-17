<%@ Page Language="C#" runat="server" Debug="true" %>
<%@ Import Namespace="System.IO" %> 
<script language="C#" runat="server">
void Page_Load()
{
  string filePath = 
    Server.MapPath(Request.QueryString["filename"]); 
  FileName.Text = Request.QueryString["filename"]; 
  FileInfo file = new FileInfo(filePath);

  if (file.Extension != ".mdb" 
    && file.Extension != ".xml" 
    && file.Extension != ".exe") 
  { 
    Code.Text = ReadFile(filePath); 
  } 
  else 
  { 
    Code.Text = "Sorry you can't read a file with an extension of " + file.Extension; 
  }
}

private string ReadFile(string filepath)
{
  string fileOutput = "";
  try
  {
    StreamReader FileReader = new StreamReader(filepath); 
  //The returned value is -1 if no more characters are 
  //currently available. 
  while (FileReader.Peek() > -1) 
  { 
    //ReadLine() Reads a line of characters from the 
   //current stream and returns the data as a string. 
   fileOutput += FileReader.ReadLine().Replace("<", "&lt;"). 
   Replace(" ", "&nbsp;&nbsp;&nbsp;&nbsp;") 
                        + "<br />"; 
    } 
    FileReader.Close();
  }
  catch (FileNotFoundException e)
  {
    fileOutput = e.Message;
  }
  return fileOutput;
}
</script>

<html>
<head>
  <title>code</title>
  <link rel="stylesheet" href="style1.css" type="text/css">
</head>
<body>
  <h1 class="pageHeader">Source Code</h1>
  <asp:label id="FileName" 
          CssClass="codeheader" Runat="server"/> 
  <asp:Panel id="pnlCode" CssClass="code" 
    runat="server" Width="80%"> 
    <asp:label id="Code" Runat="server" /> 
  </asp:Panel>
</body>
</html>