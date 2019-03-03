<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output omit-xml-declaration="yes" method="html"/>
    <xsl:template match="/">
    <html>
        <head><h1>Designer</h1>
            <img src="C:/Users/Shuan_000/Desktop/IMT542/courseProjectRootFolder/CourseProjectRootFolder/HTML/images/SophinLiu.JPG"
                title="{/clothBase/about/images/image}" height="200px" width="200px"/>
             <desciption><b><xsl:value-of select="/clothBase/about/designer"/></b></desciption></head>
         <bannerArea>
             <i><xsl:value-of select="/clothBase/about/description"/></i>
         </bannerArea> 
        <localNavArea>
              <h2>Wedding Dress Catergory</h2>
              <table>
                 <tr>
                     <th>Category Name</th>
                     <th>Price Level</th>
                     <th>Image Display</th>
                 </tr>
                 <tr>
                     <th><li>Party</li></th>
                     <th>Low</th>
                     <th><img src="C:/Users/Shuan_000/Desktop/IMT542/courseProjectRootFolder/W7/CourseProjectRootFolder/HTML/images/1.JPG"
                         height="100px" width="100px"/></th>
                 </tr>
                     <th><li>Toast</li></th>
                     <th>Middle</th>
                      <th><img src="C:/Users/Shuan_000/Desktop/IMT542/courseProjectRootFolder/W7/CourseProjectRootFolder/HTML/images/5.JPG"
                      height="100px" width="100px"/></th>
                  <tr>
                     <th><li>Royal Wedding</li></th>
                     <th>High</th>
                      <th><img src="C:/Users/Shuan_000/Desktop/IMT542/courseProjectRootFolder/W7/CourseProjectRootFolder/HTML/images/15.JPG"
                          height="100px" width="100px"/></th>
                 </tr>
             </table>
        </localNavArea> 
        
            <body>
                <h2>Dress Info</h2>
                <table border="1">
                    <tr>
                        <td>ClothName</td>
                        <td>Price</td>
                        <td>Size Avaliability</td>
                        <td>Description</td>
                        <td>Color</td>
                       
                    </tr>
                    <xsl:for-each select="//cloth">
                        <tr>
                            <th>
                                <xsl:value-of select="name"/>
                            </th>
                            <th>
                                <xsl:value-of select="price"/>
                            </th>
                            <th>
                                <xsl:value-of select="size"/>
                            </th>
                            <th>
                                <li>
                                <xsl:value-of select="description"/></li>
                            </th>
                            <th>
                                <xsl:value-of select="color"/>
                            </th>
                        </tr>
                    </xsl:for-each>
                </table>
                              
            </body>
 
    </html>                     
   </xsl:template>
</xsl:stylesheet>