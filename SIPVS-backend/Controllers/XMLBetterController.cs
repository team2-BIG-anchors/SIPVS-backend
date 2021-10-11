using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPVS_backend.Handlers;
using HttpGetAttribute = Microsoft.AspNetCore.Mvc.HttpGetAttribute;
using RouteAttribute = Microsoft.AspNetCore.Mvc.RouteAttribute;

namespace SIPVS_backend.Controllers
{
    [Route("api/xml2")]
    [ApiController]
    public class XMLBetterController : ApiController
    {

        // GET: api/<XMLController>
        [Route("isvalid")]
        [HttpGet]
        public bool isXMLValid()
        {
            XMLHandler handler = new XMLHandler();
            bool isValid = handler.isXMLValid();
            return true;
        }

        [Route("savexml")]
        [HttpGet]
        public async Task<FileStreamResult> saveXML()
        {
            XMLHandler handler = new XMLHandler();
            var stream = await handler.createXML();
            //if (String.IsNullOrEmpty(id))
            //    return Request.CreateResponse(HttpStatusCode.BadRequest);
            return new FileStreamResult(stream, "application/octet-stream");

        }

        [Route("visualize")]
        [HttpGet]
        public async Task<FileStreamResult> visualizeXML()
        {
            XMLHandler handler = new XMLHandler();
            var stream = await handler.createHTML();
            return new FileStreamResult(stream, "application/octet-stream");

        }

    }
}
