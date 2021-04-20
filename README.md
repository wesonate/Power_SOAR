# Power_SOAR
Security Orchestration, Automation and Response (SOAR) project built around PowerShell
![power_soar](https://user-images.githubusercontent.com/81455058/115311482-5537f000-a135-11eb-8018-997fd988b306.PNG)

**Description**

POWER_SOAR is an Information Security Orchestration, Automation and Response (SOAR) project built around PowerShell and Microsoft Power Automate. When paired with the  Power Automate mobile app, security teams can execute powerful incident response actions with the click of a button from any mobile device.



**Background**

POWER_SOAR, the pet project of an EDU security admin and has been under development for the past two years.  Initially created as a security stopgap measure, the project has since evolved to incorporate over 100 automated and on-demand actions and workflows.
The project was made public to help showcase the power of SOAR, demonstrate real-world SOAR use cases and help the creator become familiar with GitHub.



**Target Audience**

•	Small/understaffed security teams

•	Lack funds for MSSP or enterprise SOAR solution

•	Interest in running incident response actions from a mobile app

•	Just curious about what others are doing around with security automation



**Prerequisites**

•	Internet-connected Windows Computer

•	Microsoft Power Automate License (Free Community Plan Available, 
    https://powerapps.microsoft.com/en-us/communityplan/)
    
•	On-premises Data Gateway
    https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-install
    
•	Microsoft Power Automate Mobile App available on the Google Play and Apple Appstore



**Getting Started**

To get started, complete the following setup steps:
1.	Download and install the on-premises Data Gateway - https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-install 
2.	From the Data Gateway computer, extract the contents of POWER_SOAR.ZIP to C:\
3.	Launch Flow.ps1 to start the Power_SOAR listener
4.	Using the Power Automate mobile app or web portal, add a new on-demand flow to test your configuration.
    
    ![ps_5](https://user-images.githubusercontent.com/81455058/115472078-b11a7b80-a1fe-11eb-9503-8ece6987a497.PNG)
    
5.	From the Power Automate mobile app or web app, run your new on-demand flow action.

    ![ps_3](https://user-images.githubusercontent.com/81455058/115313199-751ce300-a138-11eb-9cae-b5d12acc2374.PNG)

6.	Confirm that the action completed successfully.  For this example, we simply open the calculator on the Data Gateway computer.

    ![ps_4](https://user-images.githubusercontent.com/81455058/115314222-63d4d600-a13a-11eb-926d-f69ba683ae30.PNG)

**Examples**

New Workflows and On-Demand actions will be added weekly, including connectors for Palo Alto Networks, Cortex XDR, Wildfire, Mimecast, O365/Azure, Active Directory and more.

**Coming Soon: Deactivating Domain Users (AD + Azure + revoke access token) with the press of a button.**


**Inspiration & Acknowledgments**

•	Flow of the Week: Local code execution by Jessica Cook - https://flow.microsoft.com/en-us/blog/flow-of-the-week-local-code-execution/


![ps_5](https://user-images.githubusercontent.com/81455058/115472069-ab249a80-a1fe-11eb-9b71-02d32cf8d613.PNG)
