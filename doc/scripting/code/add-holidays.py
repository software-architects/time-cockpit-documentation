# ######################################################################################################## 
# Floating Holidays 
# ######################################################################################################## 


# ########################## 
# Easter Sunday 
# Ostersonntag 
# Taken from: http://www.codeproject.com/KB/datetime/christianholidays.aspx 
# ########################## 
def easterDay(year):
    #This algorithm is based in part on the algorithm of Oudin (1940) as quoted in 
    #"Explanatory Supplement to the Astronomical Almanac", P. Kenneth Seidelmann. 


    #G is the Golden Number-1 
    #H is 23-Epact (modulo 30) 
    #I is the number of days from 21 March to the Paschal full moon 
    #J is the weekday for the Paschal full moon (0=Sunday, 1=Monday, etc.) 
    #L is the number of days from 21 March to the Sunday on or before the Paschal full moon (a number between -6 and 28) 
    #C is then Century


    G = year % 19
    C = year / 100

    X = C / 4
    Y = (8 * C + 13) / 25
    Z = 19 * G
    H = (C - X - Y + Z + 15) % 30

    X = H / 28
    Y = 29 / (H + 1)
    Z = (21 - G) / 11
    I = H - X * (1 - Y * Z)

    X = year / 4
    Y = C / 4
    J = (year + X + I + 2 - C + Y) % 7

    L = I - J
    X = (L + 40) / 44
    EasterMonth = 3 + X

    X = EasterMonth / 4
    EasterDay = L + 28 - 31 * X
    return DateTime(year, EasterMonth, EasterDay)

# ########################## 
# Palm Sunday 
# Palmsonntag 
# ########################## 
def palmSunday(year):
    return easterDay(year).AddDays(-7);

# ########################## 
# Good Friday 
# Karfreitag 
# ########################## 
def goodFriday(year):
    return easterDay(year).AddDays(-2);

# ########################## 
# Easter Monday 
# Ostermontag 
# ########################## 
def easterMonday(year):
    return easterDay(year).AddDays(1);

# ########################## 
# Ascension Day 
# Christi Himmelfahrt 
# ########################## 
def ascensionDay(year):
    return easterDay(year).AddDays(39)

# ########################## 
# Whit Sunday 
# Pfingstsonntag 
# ########################## 
def whitSunday(year):
    return easterDay(year).AddDays(49);

# ########################## 
# Whit Monday 
# Pfingstsonntag 
# ########################## 
def whitMonday(year):
    return easterDay(year).AddDays(50);

# ########################## 
# Trinity Sunday 
# Trinity Sunday 
# ########################## 
def trinitySunday(year):
    return easterDay(year).AddDays(56);

# ########################## 
# Corpus Christi 
# Fronleichnam 
# ########################## 
def corpusChristi(year):
    return trinitySunday(year).AddDays(4)

# ########################## 
# Add Floating Holidays 
# ########################## 
def addFloatingHolidays(dc, holidayCalendar, year):
    dc.BeginTransaction()
    try:
        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Palmsonntag"
        holiday.LegalHolidayDate = palmSunday(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Ostersonntag"
        holiday.LegalHolidayDate = easterDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Ostermontag"
        holiday.LegalHolidayDate = easterMonday(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Christi Himmelfahrt"
        holiday.LegalHolidayDate = ascensionDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Pfingstsonntag"
        holiday.LegalHolidayDate = whitSunday(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Pfingstmontag"
        holiday.LegalHolidayDate = whitMonday(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Fronleichnam"
        holiday.LegalHolidayDate = corpusChristi(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        dc.TryCommitTransaction()
    except:
        dc.TryRollbackTransaction()
        raise 

# ######################################################################################################## 
# Fixed Holidays 
# ######################################################################################################## 


# ########################## 
# New Years Day 
# Neujahr 
# ########################## 
def newYearsDay(year):
    return DateTime(year, 1, 1)

# ########################## 
# Epiphany 
# Heiligen 3 
ge 
# ########################## 
def epiphanyDay(year):
    return DateTime(year, 1, 6)

# ########################## 
# Labor Day 
# Staatsfeiertag (Tag der Arbeit) 
# ########################## 
def laborDay(year):
    return DateTime(year, 5, 1)

# ########################## 
# Assumption of Mary 
# Maria Himmelfahrt 
# ########################## 
def assumptionOfMaryDay(year):
    return DateTime(year, 8, 15)

# ########################## 
# Austrian National Day 
# Nationalfeiertag 
# ########################## 
def nationalDay(year):
    return DateTime(year, 10, 26)

# ########################## 
# All Saints Day 
# Allerheiligen 
# ########################## 
def allSaintsDay(year):
    return DateTime(year, 11, 1)

# ########################## 
# Feast of the Immaculate Conception 
# Maria Empfängnis 
# ########################## 
def immaculateConceptionDay(year):
    return DateTime(year, 12, 8)

# ########################## 
# Christmas Day 
# Christtag 
# ########################## 
def christmasDay(year):
    return DateTime(year, 12, 25)

# ########################## 
# St Stephen's Day 
# Stefanitag 
# ########################## 
def stStepanDay(year):
    return DateTime(year, 12, 26)

# ########################## 
# Add Fixed Holidays 
# ########################## 
def addFixedHolidays(dc, holidayCalendar, year):
    dc.BeginTransaction()
    try:
        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Neujahr"
        holiday.LegalHolidayDate = newYearsDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()  
        holiday.LegalHolidayName = "Heilige 3 Könige"
        holiday.LegalHolidayDate = epiphanyDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Staatsfeiertag (Tag der Arbeit)"
        holiday.LegalHolidayDate = laborDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Maria Himmelfahrt"
        holiday.LegalHolidayDate = assumptionOfMaryDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Nationalfeiertag"
        holiday.LegalHolidayDate = nationalDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Allerheiligen"
        holiday.LegalHolidayDate = allSaintsDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Maria Empfängnis"
        holiday.LegalHolidayDate = immaculateConceptionDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Christtag"
        holiday.LegalHolidayDate = christmasDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        holiday = dc.CreateLegalHoliday()
        holiday.LegalHolidayName = "Stefanitag"
        holiday.LegalHolidayDate = stStepanDay(year)
        holiday.LegalHolidayCalendar = holidayCalendar
        dc.SaveObject(holiday)

        dc.TryCommitTransaction()
    except:
        dc.TryRollbackTransaction()
        raise 

# choose between case-1 or case-2 

# --- case-1: create a new holiday calendar (if you use time cockpit the first year) 
#holidayCalendar = Context.CreateLegalHolidayCalendar() 
#holidayCalendar.LegalHolidayCalendarName = 'Austrian Legal Holidays' 
#Context.SaveObject(holidayCalendar) 
# --- end case-1 

# --- case-2: add holidays for the next year to an existing holiday calendar 
#existingCalendar = 'Austrian Legal Holidays'   # set existing calendar to the appropriate name in your time cockpit environment  

#holidayCalendar = Context.SelectSingleWithParams({ 
#    "Query": "From C In LegalHolidayCalendar Where C.LegalHolidayCalendarName=@CalendarName Select C", 
#    "@CalendarName" : existingCalendar 
#    }); 
# --- end case-2

addFloatingHolidays(Context, holidayCalendar, 2017)
addFixedHolidays(Context, holidayCalendar, 2017)

print "DONE!"
