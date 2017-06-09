using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Xml;
using System.Xml.Linq;
using System.Web.Caching;

namespace TimeCockpit.UrlRedirect
{
	/// <summary>
	/// Uses file '/App_Data/RequestUrlRemappings.xml' to re-map incoming requests.
	/// </summary>
	public class RequestUrlMapperModule : IHttpModule
	{
		private const string mappingPath = "/App_Data/UrlRedirect/RequestUrlMappings.xml";

		public void Dispose()
		{
		}

		public void Init(HttpApplication context)
		{
			context.BeginRequest += Context_BeginRequest;
		}

		private void Context_BeginRequest(object sender, EventArgs e)
		{
			this.Redirect();
		}

		private void Redirect()
		{
			try
			{
				var mappings = HttpContext.Current.Cache["RequestUrlMappings"] as Dictionary<string, string>;
				if (mappings == null)
				{
					mappings = LoadMappings();
					HttpContext.Current.Cache.Add("RequestUrlMappings", mappings, null, Cache.NoAbsoluteExpiration, new TimeSpan(0, 0, 0), CacheItemPriority.Normal, null);
				}

				if (mappings != null)
				{
					var topic = HttpContext.Current.Request.QueryString["topic"];
					var mapping = mappings.FirstOrDefault(m => HttpContext.Current.Request.Path.ToLower().EndsWith(m.Key) || (!string.IsNullOrEmpty(topic) && topic.ToLower().EndsWith(m.Key)));
					if (!string.IsNullOrEmpty(mapping.Value))
					{
						HttpContext.Current.Response.RedirectPermanent(mapping.Value);
					}
				}
			}
			catch { }
		}

		private Dictionary<string, string> LoadMappings()
		{
			var mappings = new Dictionary<string, string>();

			var path = HttpContext.Current.Server.MapPath(mappingPath);
			if (File.Exists(path))
			{
				var document = XDocument.Load(path);
				foreach (var mapping in document.Descendants("Mapping"))
				{
					var key = mapping.Attribute("RequestPath").Value.ToLower();
                    var value = mapping.Attribute("RewritePath").Value;
					if (!mappings.Keys.Contains(key))
					{
						mappings.Add(key, value);
					}
				}
			}

			return mappings;
		}
	}
}
