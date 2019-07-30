# HaveIBeenpwned_RobotFramework
General POC to test EMail IDs on https://haveibeenpwned.com/ using robot Framework

# Requirements

Python 2.7.x

Python's RobotFramework  pip install robotframework

ChromeDriver.exe

# How to run

Move to folder HaveIBeenpwned_RobotFramework from console and run

pybot --outputdir ./Report TestSuite\EmailID_PawnCheck.robot

# Input

Folder Res has file emailidlist.txt, please update the email id's with desired one to test

# Output

Open Report under HaveIBeenpwned_RobotFramework folder and open report.html for easy report.


# Conclusion

Execution doesn't provide assertion if EMail is pawned or not pawned but simply prints the results.

In the file res\resource.robot please uncomment Fail by removing '#' and re run it again. 

Note : If EMail is Pawned then complete loop of execution will stop giving failure which is expected behaviour.
