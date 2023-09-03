 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head runat="server">
        <title>Autode leht</title>
    </head>
    <body>
        <h1>Ülesanned. Failid: autod_.xml ja auto_lisa.xslt</h1>
        <form id="form1" runat="server">
            <div>
                <asp:Xml ID="xml" runat="server"
                    DocumentSource="~/autod_.xml"
                    TransformSource="~/auto_lisa.xslt" />
            </div>
        </form>
    </body>
</html>
