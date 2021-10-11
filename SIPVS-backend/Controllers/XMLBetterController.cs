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

namespace SIPVS_backend.Controllers
{

    [Route("api/xml2")]
    [ApiController]
    public class XMLBetterController : ControllerBase
    
    {

        // GET: api/<XMLController>
        [Route("isvalid")]
        [HttpGet]
        public async Task<string> isXMLValid(List<IFormFile> files)
        {

            IFormFile file = files.First();
            string filePath = Path.Combine("../DATA/", file.FileName);
            using (Stream fileStream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(fileStream);
            }
            XMLHandler handler = new XMLHandler();
            string isValid = handler.isXMLValid(filePath);
            return isValid;
                
            

        }


        [Route("savexml")]
        [HttpGet]
        public FileContentResult saveXML()
        {
            XMLHandler handler = new XMLHandler();
            FileContentResult stream = handler.createXML();
            return stream;
        }


        [Route("visualize")]
        [HttpPost]
        public async Task<FileContentResult> visualizeXML(List<IFormFile> files)
        {

            IFormFile file = files.First();
            string filePath = Path.Combine("../DATA/", file.FileName);
            using (Stream fileStream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(fileStream);
            }

            XMLHandler handler = new XMLHandler();
            FileContentResult stream = handler.createHTML(filePath);
            return stream;


    }

}
}
