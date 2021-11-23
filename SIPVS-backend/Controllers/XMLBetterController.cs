using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPVS_backend.Handlers;
using HttpGetAttribute = Microsoft.AspNetCore.Mvc.HttpGetAttribute;
using HttpPostAttribute = Microsoft.AspNetCore.Mvc.HttpPostAttribute;
using RouteAttribute = Microsoft.AspNetCore.Mvc.RouteAttribute;
using FromBodyAttribute = Microsoft.AspNetCore.Mvc.FromBodyAttribute;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.Serialization.Json;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Xsl;
using Newtonsoft.Json;
using System.Globalization;

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
public class DisableFormValueModelBindingAttribute : Attribute, IResourceFilter
{
    public void OnResourceExecuting(ResourceExecutingContext context)
    {
        var factories = context.ValueProviderFactories;
        factories.RemoveType<FormValueProviderFactory>();
        factories.RemoveType<JQueryFormValueProviderFactory>();
    }

    public void OnResourceExecuted(ResourceExecutedContext context)
    {
    }
}

namespace SIPVS_backend.Controllers
{


    [Route("api/xml2")]
    [ApiController]
    public class XMLBetterController : ControllerBase

    {

        // GET: api/<XMLController>
        [Route("isvalid")]
        [HttpPost]
        [DisableFormValueModelBinding]
        public string isXMLValid(List<IFormFile> files)
        {
            IFormFile file = files.First();
            string filePath = Path.Combine("../DATA/", file.FileName);
            using (Stream fileStream = new FileStream(filePath, FileMode.OpenOrCreate))
            {
                file.CopyTo(fileStream);

            }

            XMLHandler handler = new XMLHandler();
            string isValid = handler.isXMLValid(filePath);
            System.IO.File.Delete(filePath);
            return isValid;
        }

        public class JSONBody
        {
            public object json { get; set; }
        }

        [Route("savexml")]
        [HttpPost]
        public FileContentResult saveXML(JSONBody x)
        {
            XMLHandler handler = new XMLHandler();
            FileContentResult stream = handler.createXML(x.json.ToString());
            return stream;
        }

        [Route("timestamptest")]
        [HttpGet]
        public string timestamptest()
        {
            XMLHandler handler = new XMLHandler();
            string result = handler.test2();
            return result;
        }

        [Route("timestamp")]
        [HttpPost]
        public async Task<FileContentResult> timestamp(List<IFormFile> files)
        {
            IFormFile file = files.First();
            string filePath = Path.Combine("../DATA/", file.FileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(fileStream);
            }
            XMLHandler handler = new XMLHandler();
            FileContentResult stream = handler.timestamp(filePath);
            System.IO.File.Delete(filePath);
            return stream;

        }


        [Route("visualize")]
        [HttpPost]
        public async Task<FileContentResult> visualizeXML(List<IFormFile> files)
        {

            IFormFile file = files.First();
            string filePath = Path.Combine("../DATA/", file.FileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create))
            {
                file.CopyTo(fileStream);
            }

            XMLHandler handler = new XMLHandler();
            FileContentResult stream = handler.createHTML(filePath);
            System.IO.File.Delete(filePath);
            return stream;
        }

        [Route("getSchema")]
        [HttpGet]
        public Dictionary<string, string> getXMLschema()
        {
            XMLHandler handler = new XMLHandler();
            Dictionary<string, string> response = handler.getSchema();
            return response;
        }

    }
}
