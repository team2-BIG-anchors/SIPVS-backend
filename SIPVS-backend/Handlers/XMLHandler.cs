using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SIPVS_backend.Handlers
{
    public class XMLHandler
    {

        public IEnumerable<string> test() { 
            return new string[] { "value1", "value2" };
        }

        public bool isXMLValid() {
            bool isValid = false;
            return isValid;
        }

        public async Task<FileStream> createXML() { 
            string fileName = "formular.xml";
            string localFilePath = @"C:\Users\william.brach\Developer\SIPVS-backend\XML\formular.xml";
            var stream = File.OpenRead(localFilePath);
            return stream;
        
        }

        public async Task<FileStream> createHTML()
        {
            string fileName = "formular.xml";
            string localFilePath = @"C:\Users\william.brach\Developer\SIPVS-backend\XML\formular.xml";
            var stream = File.OpenRead(localFilePath);
            return stream;


        }

    }
}
