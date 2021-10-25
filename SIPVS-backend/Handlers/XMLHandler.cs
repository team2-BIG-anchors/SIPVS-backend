﻿using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Xsl;
using Newtonsoft.Json;


namespace SIPVS_backend.Handlers
{
    public class XMLHandler
    {

        public IEnumerable<string> test() { 
            return new string[] { "value1", "value2" };
        }

        public string isXMLValid(string xmlPath) {

            XmlSchemaSet schema = new XmlSchemaSet();
            schema.Add("", "../XML/schema.xsd");
            XmlReader rd = XmlReader.Create(xmlPath);
            XDocument doc = XDocument.Load(rd);
            try
            {
                doc.Validate(schema, ValidationEventHandler);
                rd.Close();
                return "XML is valid.";
            }
            catch (Exception e) {
                rd.Close();
                return e.Message;
            }
        }

        static void ValidationEventHandler(object sender, ValidationEventArgs e)
        {
            XmlSeverityType type = XmlSeverityType.Warning;
            if (Enum.TryParse<XmlSeverityType>("Error", out type))
            {
                if (type == XmlSeverityType.Error) throw new Exception(e.Message);
            }
        }

        public FileContentResult createXML(string jsonString) {
            XNode xml  = JsonConvert.DeserializeXNode(jsonString, "form");
            string name = "filledForm.xml" ;
            using (FileStream fs = new FileStream("../XML/" + name, FileMode.Create))
            {
                using (StreamWriter w = new StreamWriter(fs, Encoding.UTF8))
                {
                    StringBuilder builder = new StringBuilder(xml.ToString());
                    builder.Replace("<form>", "<form xmlns=\"http://smetiari.sk/form/ES/1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">");
                    builder.Replace("<other_study>", "<other_study study_id='1'>");
                    string y = builder.ToString(); // Value of y is "Hello 1st 2nd world"
                    w.Write(y);
                }
            }
            string localFilePath = Path.GetFullPath("../XML/" + name);
            var data = System.IO.File.ReadAllBytes(localFilePath);
            var result = new FileContentResult(data, "application/octet-stream")
            {
                FileDownloadName = name
            };
            return result;
        }

        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public FileContentResult createHTML(string xmlPath)
        {

            string xsltPath = "../XML/view.xsl";

            XslCompiledTransform transform = new XslCompiledTransform();

            
            transform.Load(xsltPath);
            StringWriter results = new StringWriter();
            transform.Transform(xmlPath, null, results);

            string html_name = "HTML"+RandomString(5)+".html";
            using (FileStream fs = new FileStream("../DATA/" + html_name, FileMode.Create))
            {
                using (StreamWriter w = new StreamWriter(fs, Encoding.UTF8))
                {
                    w.Write(results.ToString());
                }
            }
            
            string localFilePath = Path.GetFullPath("../Data/" + html_name);
            var data = System.IO.File.ReadAllBytes(localFilePath);
            var result = new FileContentResult(data, "application/octet-stream")
            {
                FileDownloadName = "form_html.html"
            };
            return result;
        }

        public Dictionary<string, string> getSchema()
        {

            Dictionary<string, string> result = new Dictionary<string, string>();

            string xsltPath = "../XML/view.xsl";
            string docXSLT = File.ReadAllText(xsltPath);
            string xsdPath = "../XML/schema.xsd";
            string docXSD = File.ReadAllText(xsdPath);

            result["xslt"] = docXSLT;
            result["xsd"] = docXSD;
            return result;

        }
    }
}
