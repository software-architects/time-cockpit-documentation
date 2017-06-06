clr.AddReference("TimeCockpit.Common")
from System.Net.Mail import *
from System.Net import *
from TimeCockpit.Common import Logger, LogLevel

mailFrom = "..."
mailTo = "..."
smtpHost = "..."
smtpUser = "..."
smtpPassword = "..." 

def SendMail(smtpServer, subject, body):
    mail = MailMessage()
    mail.From = MailAddress(mailFrom)
    mail.To.Add(MailAddress(mailTo))

    mail.Subject = subject
    mail.Body = body
    mail.IsBodyHtml = True

    try:
        smtpServer.Send(mail)
    except Exception, e:
        Logger.Write(LogLevel.Error, "An error occurred: {0}\n{1}", e.Message, e.StackTrace)
        raise e

def NotifyProjectManager(dataContext):
    dc = dataContext
    try:
        projects = dc.Select('''From P In APP_Project 
                                Where P.APP_Closed = False 
                                And P.APP_BudgetInHours <= (From T In P.Timesheets Select New With { .DurationSum = Sum(T.APP_DurationInHours) })
                                Select P''')

        with SmtpClient(smtpHost) as smtpServer:
            smtpServer = SmtpClient();
            smtpServer.Credentials = NetworkCredential(smtpUser, smtpPassword);
            smtpServer.Host = smtpHost;
            smtpServer.Port = 25;

            for project in projects:
                print project.ProjectName
                SendMail(smtpServer, "Project '{0}' is over budget".format(project.APP_Fullname), "")

        Logger.Write(LogLevel.Information, "DONE")
    except Exception, e:
        Logger.Write(LogLevel.Error, "An error occurred: {0}\n{1}", e.Message, e.StackTrace)
        raise e

NotifyProjectManager(Context)