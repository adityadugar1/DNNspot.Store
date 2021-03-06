/*
* This software is licensed under the GNU General Public License, version 2
* You may copy, distribute and modify the software as long as you track changes/dates of in source files and keep all modifications under GPL. You can distribute your application using a GPL library commercially, but you must also provide the source code.

* DNNspot Software (http://www.dnnspot.com)
* Copyright (C) 2013 Atriage Software LLC
* Authors: Kevin Southworth, Matthew Hall, Ryan Doom

* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.

* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

* Full license viewable here: http://www.gnu.org/licenses/gpl-2.0.txt
*/

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace DNNspot.Store
{
    public static class StoreExtensions
    {
        public static bool IsValidSlug(this string source)
        {
            return RegexPatterns.IsValidSlug.IsMatch(source);
        }

        public static bool IsValidSku(this string source)
        {
            return RegexPatterns.IsValidSku.IsMatch(source);
        }

        public static string CreateUniqueSequentialFileNameInDir(this string originalFilename, string directory)
        {
            string fileExt = Path.GetExtension(originalFilename);

            string testFileNoExt = Path.GetFileNameWithoutExtension(originalFilename);
            int i = 2;
            const int maxAttempts = 10000;
            while(i <= maxAttempts)
            {                
                string f = Path.Combine(directory, testFileNoExt + fileExt);
                if(!File.Exists(f))
                {
                    // we have a unique one!
                    return Path.GetFileName(f);
                }

                testFileNoExt = string.Format("{0}_{1}", testFileNoExt, i);
                i++;
            }

            throw new ApplicationException(string.Format(@"Unable to create unique sequential filename for ""{0}"". Gave up after {1} attempts", originalFilename, maxAttempts));
        }

        public static string AddUrlParam(this string originalUrl, string newParamKey, string newParamValue)
        {
            if(originalUrl.Contains("?"))
            {
                return originalUrl + string.Format("&{0}={1}", newParamKey, newParamValue);
            }
            else
            {
                return originalUrl + string.Format("?{0}={1}", newParamKey, newParamValue);    
            }
        }
    }
}
