using Microsoft.AspNetCore.Mvc;
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
using System.Net;

namespace SIPVS_backend.Handlers
{
    public class XMLHandler
    {

        public IEnumerable<string> test()
        {
            return new string[] { "value1", "value2" };
        }

        public string isXMLValid(string xmlPath)
        {

            XmlSchemaSet schema = new XmlSchemaSet();
            schema.Add("http://smetiari.sk/form/ES/1.0", "../XML/schema.xsd");
            XmlReader rd = XmlReader.Create(xmlPath);
            XDocument doc = XDocument.Load(rd);
            try
            {
                doc.Validate(schema, ValidationEventHandler);
                rd.Close();
                return "XML is valid.";
            }
            catch (Exception e)
            {
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

        public FileContentResult createXML(string jsonString)
        {
            XNode xml = JsonConvert.DeserializeXNode(jsonString, "form");
            string name = "filledForm.xml";
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


        #region SAOP KOKOTINA
        public string CallWebService()
        {
            var _url = "https://test.ditec.sk/timestampws/TS.asmx";
            var _action = "https://test.ditec.sk/timestampws/TS.asmx?op=GetTimestamp";

            XmlDocument soapEnvelopeXml = CreateSoapEnvelope();
            HttpWebRequest webRequest = CreateWebRequest(_url, _action);
            InsertSoapEnvelopeIntoWebRequest(soapEnvelopeXml, webRequest);

            // begin async call to web request.
            IAsyncResult asyncResult = webRequest.BeginGetResponse(null, null);

            // suspend this thread until call is complete. You might want to
            // do something usefull here like update your UI.
            asyncResult.AsyncWaitHandle.WaitOne();

            // get the response from the completed web request.
            string soapResult;
            using (WebResponse webResponse = webRequest.EndGetResponse(asyncResult))
            {
                using (StreamReader rd = new StreamReader(webResponse.GetResponseStream()))
                {
                    soapResult = rd.ReadToEnd();
                }
            }
            return soapResult;
        }

        private static HttpWebRequest CreateWebRequest(string url, string action)
        {
            HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(url);
            webRequest.Headers.Add("SOAPAction", action);
            webRequest.ContentType = "text/xml;charset=\"utf-8\"";
            webRequest.Accept = "text/xml";
            webRequest.Method = "GET";
            return webRequest;
        }

        private static XmlDocument CreateSoapEnvelope()
        {
            XmlDocument soapEnvelopeDocument = new XmlDocument();
            soapEnvelopeDocument.LoadXml(
            @"<soap:Envelope xmlns: xsi = ""http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd = ""http://www.w3.org/2001/XMLSchema"" xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/"">
                <soap:Body>
                    <GetTimestamp xmlns = ""http://www.ditec.sk/"" >
                        <dataB64>string</dataB64>
                    </GetTimestamp>
                </soap:Body>
            </soap:Envelope>");

            return soapEnvelopeDocument;
        }

        private static void InsertSoapEnvelopeIntoWebRequest(XmlDocument soapEnvelopeXml, HttpWebRequest webRequest)
        {
            using (Stream stream = webRequest.GetRequestStream())
            {
                soapEnvelopeXml.Save(stream);
            }
        }
        #endregion

        public FileContentResult timestamp(string jsonString)
        {
            XNode xml = JsonConvert.DeserializeXNode(jsonString, "form");


            string name = "filledForm.xml";

            // TODO write/load sign xml / 
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

            // TODO extract element z sign xml

            // TODO call CallWebService

            // TODO extract token from response

            // TODO create new BCcrypt with token

            // TODO get new xml element

            // TODO insert new xml element

            // return
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

            string html_name = "HTML" + RandomString(5) + ".html";
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
