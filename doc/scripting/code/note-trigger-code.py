clr.AddReference("System") 
clr.AddReference("System.Data")
clr.AddReference("System.Core")
clr.AddReference("TimeCockpit.Common")
from System.Text.RegularExpressions import Regex
from System.Globalization import CultureInfo

from System.Linq import Enumerable
from TimeCockpit.Common import Logger, LogLevel
from System.Collections.Generic import List, Dictionary, KeyValuePair

import System
clr.ImportExtensions(System.Linq)
from TimeCockpit.Data import EntityObject, DataContextType

def generateProjectCode(actionContext):
    currentYear = DateTime.Today.ToString('yy')
    regexString = String.Format("^P{0}-(\d+)$", currentYear)
    regex = Regex(regexString)

    def getLastProjectCode(projectCodes):
        numbers = projectCodes.Select(lambda c: regex.Match(c.Code))
        numbers = numbers.Where(lambda m: m.Success) 
        numbers = numbers.Select(lambda m: Convert.ToDecimal(m.Groups[1].Captures[0].Value))
        return numbers.Max()

    dc = actionContext.DataContext

    if actionContext.InputSet <> None:
        for newProject in actionContext.InputSet.Take(1):
            if newProject.Code == 'To Be Generated':
                projectCodesString = dc.Select("From P In Project Order By Max(P.Code) Desc Select New With { P.Code, .Ma = Max(P.Code) }")

                if projectCodesString.Count == 0:
                    newProjectCode = Convert.ToInt32(1) 
                else:
                    latestExistingProjectCode = getLastProjectCode(projectCodesString)
                    newProjectCode = Convert.ToInt32(latestExistingProjectCode) + 1 

                if newProjectCode < 10:
                    newProject.Code = newProjectCode.ToString()
                else:
                    newProject.Code = newProjectCode.ToString()