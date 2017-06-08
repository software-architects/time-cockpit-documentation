using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GenerateRedirects
{
	class Program
	{
		static string namespaceName = string.Empty;
		static string className = string.Empty;
		static string result = string.Empty;
        static string lastRedirect = string.Empty;

        static void Main(string[] args)
		{
			var document = XDocument.Load(@"..\..\WebTOC.xml");
			var root = document.Descendants("HelpTOC").First();
			ProcessElements(root, 0);
			File.WriteAllText(@"..\..\redirects.xml", result);
            Console.WriteLine("DONE");
			Console.ReadLine();
		}

		static void ProcessElements(XElement root, int level)
		{
			foreach (var mapping in root.Elements())
			{
				var title = mapping.Attribute("Title").Value.Replace(", ", ",").Split(' ');
				var name = title[0].Replace(",", ", ");
				var type = string.Empty;
				if (title.Length > 1)
				{
					type = title[1];
				}

				switch (level)
				{
					case 0:
						result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"https://docs.timecockpit.com/api/\" />\r\n";
						break;
					case 1:
						namespaceName = name;
						result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"https://docs.timecockpit.com/api/{namespaceName}.html\" />\r\n";
						break;
					case 2:
						className = name;
						if (className == "CombinedModelCollectionView(TBase, TPrimary, TSecondary)")
						{
							className = "CombinedModelCollectionView-3";
						}

						result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"https://docs.timecockpit.com/api/{namespaceName}.{className}.html\" />\r\n";
						break;
					case 3:
						switch (type)
						{
							case "Members":
                                lastRedirect = $"https://docs.timecockpit.com/api/{namespaceName}.{className}.html";
                                result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
								break;
							case "Constructor":
                                lastRedirect = $"https://docs.timecockpit.com/api/{namespaceName}.{className}.html#constructors";
								result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
								break;
							case "Methods":
                                lastRedirect = $"https://docs.timecockpit.com/api/{namespaceName}.{className}.html#methods";
                                result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
								break;
							case "Properties":
                                lastRedirect = $"https://docs.timecockpit.com/api/{namespaceName}.{className}.html#properties";
                                result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
								break;
							case "Fields":
                                lastRedirect = $"https://docs.timecockpit.com/api/{namespaceName}.{className}.html#fields";
                                result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
								break;
							case "Events":
                                lastRedirect = $"https://docs.timecockpit.com/api/{namespaceName}.{className}.html#events";
                                result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
								break;
							default:
								Console.WriteLine($"ERROR - {namespaceName}.{className} {type}");
								break;
						}

						break;
					case 4:
                        result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
                        break;
                    case 5:
                        result += $"<Mapping RequestPath=\"{mapping.Attribute("Url").Value}\" RewritePath=\"{lastRedirect}\" />\r\n";
                        break;
                    default:
						Console.WriteLine($"{name} - {type}");
						break;
				}

				ProcessElements(mapping, level + 1);
			}
		}
	}
}
