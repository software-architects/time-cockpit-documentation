---
title: Mobile & Responsive Time Tracking Guide
description: Complete guide to using time cockpit on mobile devices including phones and tablets. Learn about responsive web access, mobile workflows, tips for on-the-go time tracking, and PWA installation.
keywords: [mobile time tracking, responsive time tracking, track time on phone, mobile app alternative, tablet time tracking, PWA time cockpit, mobile browser access, on-the-go time tracking, smartphone timesheet, mobile web app]
---

# Mobile & Responsive Time Tracking Guide

Use time cockpit on any mobile device through your web browser. The responsive web client adapts to smartphones and tablets, enabling on-the-go time tracking.

> [!TIP]
> **Looking for mobile time tracking?** Time cockpit's web client provides responsive, mobile-friendly access without requiring a native app. Learn more about [modern time tracking features](https://www.timecockpit.com/features/time-tracking-calendar/).

## Overview

Time cockpit doesn't have a dedicated native mobile app. Instead, it provides a **responsive web application** that works seamlessly on mobile browsers:

**Key Benefits:**
- ✅ **No app installation required** - Works in any modern mobile browser
- ✅ **Same familiar interface** - Consistent experience across desktop and mobile
- ✅ **Always up-to-date** - No app updates to download
- ✅ **Cross-platform** - Works on iOS, Android, and tablets
- ✅ **PWA support** - Install as a Progressive Web App for app-like experience

**Access anywhere:**
- URL: **https://web.timecockpit.com**
- Works on iPhone, iPad, Android phones, Android tablets
- Requires internet connection (cloud-based, no offline mode)

## Getting Started on Mobile

### Accessing Time Cockpit on Your Device

**iPhone/iPad:**
1. Open **Safari** or **Chrome** browser
2. Navigate to: **https://web.timecockpit.com**
3. Login with your credentials (same as desktop)
4. Interface automatically adapts to screen size

**Android Phone/Tablet:**
1. Open **Chrome** or **Firefox** browser
2. Navigate to: **https://web.timecockpit.com**
3. Login with credentials
4. Touch-friendly controls activate automatically

### Adding to Home Screen (Recommended)

Create an app-like icon for quick access:

**On iPhone/iPad:**
1. Open **https://web.timecockpit.com** in Safari
2. Tap the **Share** button (square with arrow pointing up)
3. Select **Add to Home Screen**
4. Name it "Time Cockpit"
5. Tap **Add**
6. Icon appears on home screen like a native app

**On Android:**
1. Open **https://web.timecockpit.com** in Chrome
2. Tap the **Menu** (three dots)
3. Select **Add to Home Screen**
4. Name it "Time Cockpit"
5. Tap **Add**
6. Icon appears on home screen

**Benefits:**
- One-tap launch directly to time cockpit
- Feels like a native app
- No browser chrome (address bar) when launched
- Faster access than opening browser + typing URL

## Progressive Web App (PWA) Installation

Install time cockpit as a Progressive Web App for an enhanced experience:

### Desktop Installation

**Google Chrome:**
1. Open **https://web.timecockpit.com** in Chrome
2. Look for **Install Time Cockpit** icon in the address bar (right side)
3. Click to install
4. Time cockpit opens as standalone window (no browser tabs)

**Microsoft Edge:**
1. Open **https://web.timecockpit.com** in Edge
2. Look for **App available. Install Time Cockpit** icon in address bar
3. Click to install
4. Launches as standalone application

### PWA Benefits

- **Standalone window**: No browser UI clutter
- **Task bar/dock icon**: Easier alt-tab switching
- **Desktop notifications**: Get alerts even when not active
- **Faster launch**: Opens directly without full browser startup
- **Tab strips**: Enable "Desktop PWA tab strips" in [chrome://flags/](chrome://flags/) or [edge://flags/](edge://flags/) for multi-tab PWA experience

## What Works Well on Mobile

### ✅ Quick Time Entry

**Creating Timesheet Entries:**
- Tap **+** or **New** button
- Select project/task from dropdowns (optimized for touch)
- Set start/end time with mobile time pickers
- Enter brief description
- Tap **Save**

**Best for:**
- Tracking right after meeting ends
- Logging travel time on the go
- Quick entries between tasks

### ✅ Day Calendar View

**Viewing Your Schedule:**
1. Navigate to **Timesheet** → **Time Sheet Calendar**
2. Switch to **Day View** (best for small screens)
3. Scroll through entries
4. See vacation/absence blocks
5. Tap entries to view details

**Day view advantages on mobile:**
- Less horizontal scrolling
- Larger tap targets
- Easier to read on small screen

### ✅ Vacation Requests

**Requesting Time Off:**
1. Navigate to **User** → **Vacation**
2. Tap **New**
3. Select absence type (vacation, sick leave, etc.)
4. Choose start and end dates (mobile date pickers)
5. Enter reason/notes
6. Submit for approval

**Mobile-friendly workflow:**
- Request vacation while traveling
- Check vacation balance anywhere
- Get approval notifications on phone

### ✅ Checking Time Logs

**Reviewing Your Hours:**
- View recent entries in list view
- Filter by date range
- Verify time tracked
- Check totals for week/month

**Use cases:**
- Daily standup: Reference yesterday's hours
- Weekly review: Confirm timesheet completeness
- Quick audit before submitting timesheet

### ✅ Starting/Stopping Timer

**Live Timer (if available):**
- Start timer with one tap
- Switch tasks throughout day
- Stop timer and save entry
- See elapsed time at a glance

## Mobile Limitations & Workarounds

### ❌ Limited Screen Space

**Challenge:**
- Complex reports appear cramped
- Multi-column lists require horizontal scrolling
- Detailed forms may be difficult to navigate

**Recommendation:**
- Use desktop for:
  - Generating reports
  - Bulk editing timesheets
  - Complex project setup
  - Budget analysis

**Workaround:**
- Request landscape orientation on tablet for more screen real estate
- Use simplified views when available
- Export reports to email, review on desktop later

### ❌ Typing Lengthy Descriptions

**Challenge:**
- Phone keyboards are slower than desktop typing
- Detailed descriptions tedious on small screen

**Workaround:**
1. **Create entry on mobile** with essential info:
   - Project/task
   - Duration
   - Brief note
2. **Add full description later at desk**:
   - Open entry on desktop
   - Add detailed notes, links, etc.

**Best practice:**
- Mobile: "Client call - onboarding"
- Desktop (later): "Client call with Acme Corp to discuss new project onboarding, requirements gathering for Phase 1, technical architecture questions, next steps scheduled for Feb 15"

### ❌ No Signal Tracking

**Challenge:**
- Activity tracking (Signal Tracker) requires desktop full client
- Can't track:
  - Active windows
  - File changes
  - Computer activity
  - Network connections

**Workaround:**
- Use desktop client for automatic activity tracking
- View tracked signals in mobile web client (read-only)
- Manual entry for mobile work (calls, travel, meetings)

See: [Signal Tracker Overview](../signal-tracker/overview.md) (desktop only)

### ❌ No Data Model Customization

**Challenge:**
- Can't modify data model structure on mobile
- Entity editing, custom fields, permissions must be done on desktop

**Available on mobile:**
- Use customized fields (created on desktop)
- All custom entities and lists work normally
- Permissions enforced

See: [Data Model Customization](../data-model-customization/overview.md)

### ❌ Requires Internet Connection

**Challenge:**
- No offline mode
- Must have internet connection (WiFi or mobile data)
- Can't track time without connectivity

**Recommendation:**
- Use mobile data when WiFi unavailable
- Note time on paper if completely offline, enter later
- Brief connection interruptions are handled gracefully (auto-reconnect)

## Mobile Workflows & Best Practices

### 1. On-Site Client Meetings

**Scenario:** Tracking billable hours at customer location

**Workflow:**
1. **Before meeting**: Open time cockpit on phone
2. **Start timer** (or note start time)
3. **During meeting**: Take minimal notes in Notes app
4. **After meeting**: Create timesheet entry on phone:
   - Select client project
   - Enter duration
   - Quick description: "Client meeting - requirements"
5. **Back at office**: Add detailed notes to entry

### 2. Field Service / Travel Time

**Scenario:** Tracking time while traveling between locations

**Workflow:**
1. **Arrival at site**: Create entry for travel:
   - Task: "Travel" or "Commute"
   - Duration: Drive time
   - Location: "Office → Customer Site A"
2. **Work performed**: Create entry for on-site work
3. **Departure**: Create entry for return travel
4. **End of day**: Review entries on desktop, ensure accuracy

### 3. Remote Work / Distributed Teams

**Scenario:** Team members working from various locations

**Workflow:**
1. **Morning**: Check calendar on phone during commute
2. **Throughout day**: Create entries on laptop/desktop (preferred)
3. **Evening**: Quick mobile check to verify day complete
4. **Weekend thought**: "Did I log that Friday meeting?" → Check on phone, add if missing

### 4. Quick Capture Method

**Scenario:** Busy day with many task switches

**Workflow:**
1. **During work**: Jot down activities in Notes app:
   ```
   9-10: Client A call
   10-11:30: Code review
   11:30-12: Email
   12-1: Lunch
   1-3: Development - Feature X
   ```
2. **End of day**: Open time cockpit on phone or desktop
3. **Bulk entry**: Create timesheet entries from notes
4. **Advantage**: Capture during day, enter later (mobile or desktop)

## Tablet-Specific Considerations

### Tablet vs. Phone

**Tablets (iPad, Android Tablet) provide better experience:**
- ✓ Larger screen = less cramping
- ✓ Week view more usable
- ✓ Lists with more columns visible
- ✓ Reports easier to read
- ✓ Typing easier (larger on-screen keyboard or physical keyboard)

**Recommendation:**
- Phone: Quick entries, calendar checking, vacation requests
- Tablet: Approaching desktop-like experience, good for remote work
- Desktop: Full functionality, complex tasks, reporting, customization

### Keyboard & Mouse Support

**iPadOS / Android tablets with keyboards:**
- Bluetooth keyboard works
- Mouse/trackpad supported
- Desktop-like experience possible
- Keyboard shortcuts may work (browser-dependent)

## Tips for Successful Mobile Time Tracking

### 1. Simplify Your Input

**On mobile, favor:**
- ✓ Project/task dropdowns (touch-friendly)
- ✓ Predefined values
- ✓ Time pickers (vs. manual entry)
- ✓ Short descriptions
- ✓ Standard activities

**Avoid on mobile:**
- ✗ Lengthy free-text descriptions
- ✗ Complex multi-relation lookups
- ✗ Bulk operations
- ✗ Advanced filtering

### 2. Establish a Routine

**Daily mobile habits:**
- **Morning**: Check today's calendar view (2 min)
- **Throughout day**: Create entries immediately after activities (1 min each)
- **Evening**: Quick review of day's entries (3 min)
- **Weekly**: Desktop review for completeness and detail (15 min)

### 3. Use Bookmarks & Shortcuts

**Faster navigation:**
- Bookmark **https://web.timecockpit.com** in mobile browser
- Add to home screen for app-like access
- Set PIN/biometric login for security
- Browser remembers login credentials (if desired)

### 4. Combine Mobile + Desktop

**Optimal workflow:**
- **Mobile strength**: Capture time immediately, on-the-go tracking
- **Desktop strength**: Detailed descriptions, reporting, administration
- **Together**: Most accurate timesheet with least effort

**Example:**
- Monday-Friday: Quick mobile entries throughout day (2-3 min/day)
- Friday afternoon: Desktop review, add details, run reports (20 min)

### 5. Leverage Notifications

**Stay on top of tracking:**
- Enable browser notifications on phone
- Get reminders for incomplete timesheets (if configured)
- Approval notifications for vacation requests
- Budget alerts for project managers

## Performance on Mobile

### Connection Requirements

**Minimum:**
- 3G mobile data: Usable but slower
- 4G/LTE: Good performance
- 5G: Excellent performance
- WiFi: Optimal

**Data usage:**
- Light: Timesheet entries, calendar viewing
- Entry creation: < 100 KB typically
- Report generation: May use more data (avoid on limited data plans)

### Browser Compatibility

**Recommended mobile browsers:**

**iOS:**
- ✅ Safari (best integration with iOS)
- ✅ Chrome (cross-platform consistency)

**Android:**
- ✅ Chrome (recommended)
- ✅ Firefox (good alternative)
- ⚠️ Samsung Internet (mostly works, occasional UI quirks)

**Always use latest browser version for best performance and security.**

## Comparison: Mobile Web vs. Desktop Client

| Feature | Mobile Web | Desktop Full Client |
|---------|------------|---------------------|
| **Time entry** | ✅ Full support | ✅ Full support |
| **Calendar view** | ✅ Day view best | ✅ All views optimized |
| **Reports** | ⚠️ Limited (cramped) | ✅ Full functionality |
| **Vacation requests** | ✅ Full support | ✅ Full support |
| **Signal tracking** | ❌ View only | ✅ Track + view |
| **Data model customization** | ❌ Not available | ✅ Full customization |
| **Offline mode** | ❌ Requires internet | ⚠️ Limited offline (desktop) |
| **Installation** | ✅ Browser only (or PWA) | ⚠️ Windows only |
| **Updates** | ✅ Automatic | ⚠️ Manual updates |

## Troubleshooting Mobile Issues

### Login Problems

**Issue:** Can't login on mobile

**Solutions:**
1. Verify URL: **https://web.timecockpit.com** (not http, not .org)
2. Check credentials (same as desktop)
3. Try different browser
4. Clear browser cache/cookies
5. Check internet connection

### Display Issues

**Issue:** Interface looks broken or cramped

**Solutions:**
1. Rotate device to landscape orientation
2. Zoom out using browser controls (pinch gesture)
3. Switch to Day view in calendar
4. Update browser to latest version
5. Try different browser

### Performance Issues

**Issue:** Slow loading or lag

**Solutions:**
1. Check internet connection strength
2. Close other browser tabs
3. Restart browser app
4. Clear browser cache
5. Switch from mobile data to WiFi (or vice versa)

### Timesheet Entry Not Saving

**Issue:** Entry won't save or appears to save but disappears

**Solutions:**
1. Check internet connection (must be online)
2. Verify required fields are filled
3. Check for validation errors (red text)
4. Try refreshing page (may lose unsaved changes)
5. Screenshot error message, contact support

## Future Mobile Enhancements

Time cockpit continues to improve mobile experience:

**Recent improvements:**
- Enhanced responsive layout (2025)
- PWA support for mobile devices
- Better touch target sizing
- Improved date/time pickers

**Potential future features:**
- Native mobile app (under consideration)
- Offline mode for mobile
- Mobile-specific simplified views
- Voice entry for descriptions
- Geolocation for travel time (privacy considerations)

Check [Release Notes](../release-notes/) for latest mobile improvements.

## Related Topics

### Getting Started
- [Web Client Overview](web-client.md) - Browser-based access and PWA installation
- [Overview](overview.md) - Introduction to time cockpit

### Time Tracking Features
- [Time Sheet Calendar](../timesheet-calendar/calendar.md) - Calendar interface (desktop-optimized but works on mobile)
- [Working with Timesheet Entries](../timesheet-calendar/working-with-timesheet-entries.md) - Creating and editing entries

### Mobile-Relevant FAQs
- [Employee FAQ](../employee-faq.md) - Common mobile questions for employees
- [User FAQ](../user-faq.md) - General usage including mobile tracking

### Advanced
- [Signal Tracker Overview](../signal-tracker/overview.md) - Desktop-only activity tracking
- [Data Model Customization](../data-model-customization/overview.md) - Desktop-only customization

## See Also

**Community Resources:**
- Blog: [Mobile Time Tracking Best Practices](https://www.timecockpit.com/blog/) (if available)
- Support: [support@timecockpit.com](mailto:support@timecockpit.com) for mobile-specific questions

---

*For mobile troubleshooting, check the [Employee FAQ](../employee-faq.md) or contact [support@timecockpit.com](mailto:support@timecockpit.com).*
