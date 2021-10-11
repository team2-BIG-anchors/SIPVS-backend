using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SIPVS_backend.Controllers
{
    [Route("api/xml")]
    [ApiController]
    public class XMLController : ControllerBase
    {
        // GET: api/<XMLController>
        [Route("isvalid")]
        [HttpGet()]
        public IEnumerable<string> isXMLValid()
        {
            return new string[] { "value1", "value2" };
        }

        [Route("save")]
        [HttpGet()]
        public IEnumerable<string> SaveXML()
        {
            return new string[] { "value1", "value2" };
        }

        [Route("visualize")]
        [HttpGet()]
        public IEnumerable<string> VisualizeXML()
        {
            return new string[] { "value1", "value2" };
        }

        //// GET api/<XMLController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<XMLController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<XMLController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<XMLController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
