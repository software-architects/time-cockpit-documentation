clr.AddReference("System")
clr.AddReference("PresentationFramework")
clr.AddReference("System.Core")
from System import DateTime
from System import Decimal
from System.Windows import MessageBox
from System.Linq import Enumerable
from TimeCockpit.Data import EntityObject

def createInvoice(actionContext):
  # make sure that input set contains at least one object 
  if (Enumerable.Count[EntityObject](actionContext.InputSet) > 0):
    # find next free invoice number
    lastInvoiceNumber = 0
    lastInvoice = actionContext.DataContext.SelectSingleWithParams( {
      "Query": "From I In Invoice Where :Year(I.InvoiceDate) = @YearParam And :Month(I.InvoiceDate) = @MonthParam Order By I.InvoiceNumberMonthly Desc Select New With { I.InvoiceNumberMonthly }", 
      "@YearParam": Decimal(actionContext.Parameter.InvoiceDate.Year), 
      "@MonthParam": Decimal(actionContext.Parameter.InvoiceDate.Month) })
    if (lastInvoice <> None):
      lastInvoiceNumber = lastInvoice.InvoiceNumberMonthly

    # create invoice
    newInvoice = actionContext.DataContext.CreateInvoice()
    newInvoice.InvoiceDate = actionContext.Parameter.InvoiceDate
    newInvoice.InvoiceNumberMonthly = lastInvoiceNumber + 1
    newInvoice.InvoiceText = actionContext.Parameter.InvoiceText
    newInvoice.Customer = actionContext.Parameter.Customer
    actionContext.DataContext.SaveObject(newInvoice)