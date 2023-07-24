using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.ComponentModel;

namespace source_code_samples;

public class TcProject : IChangeTracking
{
	public TcProject() => this.AcceptChanges();

	#region Fields

	private string projectName;
	private bool? billable = false;

	#endregion

	#region Properties
	public Guid APP_ProjectUuid { get; set; }

	public string APP_Code { get; set; }

	public string APP_ProjectName
	{
		get => projectName; set
		{
			if (projectName != value)
			{
				projectName = value;
				IsChanged = true;
			}
		}
	}

	public bool? APP_Billable
	{
		get => billable; set
		{
			if (billable != value)
			{
				billable = value;
				IsChanged = true;
			}
		}
	}

	[JsonIgnore]
	public bool IsChanged { get; private set; }

	#endregion

	#region Methods
	public static TcProject FromJson(JToken jsonItem)
	{
		var project = new TcProject();
		project.APP_ProjectUuid = new Guid(jsonItem["APP_ProjectUuid"].Value<string>());
		project.APP_Code = jsonItem["APP_Code"]?.Value<string>();
		project.APP_ProjectName = jsonItem["APP_ProjectName"]?.Value<string>();
		project.APP_Billable = jsonItem["APP_Billable"]?.Value<bool>();

		project.AcceptChanges();
		return project;
	}

	public void AcceptChanges() => IsChanged = false;

	#endregion
}