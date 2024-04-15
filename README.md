# Deploying a Virtual Microphone / Noise Suppression App - Across a Company's Workforce

This project aims to resolve the issue of "disruptive background noises" during virtual meetings and calls, by deploying a Virtual Microphone/Noise Suppression solution that easily integrates with **Microsoft Teams**.

![Logo](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/th5xamgrr6se0x5ro4g6.png)

> This project was completed originally, to help a co-student suppress background noises their microphone was picking up during Zoom call sessions. 
> 
> I've re-created this project to work in an IT corporate setting, changing the video/conferencing platform from Zoom to Microsoft Teams and recreating this issue as a support ticket. 

## 🛠 Tools & Technologies:

- **System:** `Windows 11`, Windows `Server OS`
- **Cloud Computing:** `Microsoft 365` / `MS Teams`
- **Device Management:** Microsoft `Intune`
- **Virtualization:** `Hyper-V`
- **Scripting/Automation:** `PowerShell`
- **Software Package Management:** `Winget`
- **Ticketing System:** `Jira` Service Management *(Cloud)*

---

# Introduction

**VGM-LAB Game Dev Studios** - *(an independant video game development company)* are facing a difficult challenge, with a number of their employees unable to have productive virtual **Teams** meetings due to several factors:

**On-Site Colleagues** - <ins>Distracting Background Noises</ins> 

> Conversations and surrounding office equipment are being picked up by remote employees' microphones, due to the site's <ins>open-office layout</ins> and <ins>lack of soundproofing</ins>.

**Remote Employees** - <ins>Voice/Room Echoes</ins>  

> Employees working from poor-acoutsic home offices, are experiencing <ins>voice echoes</ins> and <ins>room reverb</ins>, making it difficult for participants to focus and understand each other.

**Remote Clients** - <ins>Poor Audio Clarity</ins> 

> Clients' speakers were also experiencing <ins>poor audio quality</ins> during video calls and product demonstrations, making it difficult for them to hear and understand the game developers.

### 🏢 Company Background:
- The client is a small-sized Game Development company, outsourcing the management of their IT services to our Cloud Support Team.
- Their reliance on remote meetings has increased due to more team members working from home, with Microsoft Teams being their primary platform for virtual collaboration.
- Complaints include poor microphone/audio quality and background noises disrupting the flow of virtual calls and meetings.

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## ⛔ Problem Statement:
The Support Team was receiving a high volume of tickets related to microphone issues in Microsoft Teams. The problems ranged from:

- ❌ Background Noises - being audible and distracting callers
- ❌ Voice Echoes - causing confusion during client meetings and team discussions
- ❌ Muffled Audio - callers unable to hear speaker clearly


## 💡 Solution:
To address the microphone issues, I deployed a Virtual Microphone and Noise Suppression solution called `Krisp`. Krisp is a cloud-based software that can integrate directly with `Microsoft Teams`. 

Krisp was able to address each of the identified problem statements and offered the following key features:
- ✅ Background Noise Cancellation
  - *(removing disruptive office sounds and background conversations)*
- ✅ Echo Removal
  - *(eliminating voice or room echoes from any environment)* 
- ✅ Enhanced Voice Quality
  - *(improving clarity and volume balance between speaker and caller)*   

---

# 💻 Implementation:

### 1️⃣ Evaluation and Testing:
I created a test enviroment, using `Hyper-V` virtual machines to mimic the users' Microsoft Teams setup. This included the exact software configurations, hardware specs and room conditions that the end-users would be using.


[i.] **Local Users'** <ins>desktop environment</ins>

<details><summary>VM 1 checklist</summary>

  `On-Prem VM`
  - [x] **OS**: `Windows 11`
  - [x] **Hardware Specs**: CPU: *2 cores* | RAM: *8GB (8192)* | HDD1: *256GB*
  - [x] **Device Management**: local `Active Directory` on `Windows Server OS`
  - [x] **Teams Setup**: `Teams` <ins>(classic)</ins>

</details>

[ii.] **Remote Users'** <ins>desktop environment</ins>

<details><summary>VM 2 checklist</summary>

  `Cloud VM`
  - [x] **OS**: `Windows 11`
  - [x] **Hardware Specs**: CPU: *2 cores* | RAM: *8GB (8192)* | HDD1: *256GB*
  - [x] **Device Management**: `Microsoft Entra ID` / `Intune`
  - [x] **License**: `Microsoft 365` E5 
  - [x] **Teams Setup**: `Teams` <ins>(new)</ins>

</details>

> [!IMPORTANT]
> **Drop-down sections above** (^) - expand for more info.
---
I performed <ins>A/B comparison tests</ins>, to evaluate the noise supression capabilities of **Krisp** against the default **Microsft Teams** audio settings.

    TEST SCENARIO 1: Background Noise Cancellation
    
    I introduced various types of background noises, such as office conversations, 
    fan noises, and keyboard typing.
    
    The Krisp-enabled audio, consistently provided a cleaner and more focused sound, eliminating the distracting background noises.
    
![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


    TEST SCENARIO 2: Echo Removal

    I made a test call in an empty room, observing Krisp's ability to reduce the voice echo and 
    room reverberations. 

    The Krisp-enabled audio, consistently provided a clearer and more forward sound, removing the voice echoes completely.
  
![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

---

### 2️⃣ Software Deployment:
<ins>2 deployment options</ins> were created for installing Krisp, to work for each use-case scenario. 

> OPTION 1: Local deployment `PowerShell`
> 
> OPTION 2: Remote deployment `Intune`

    OPTION 1: Single User, LOCAL Deployment

    For local deployments, I developed a PowerShell script in combination with the Windows Package Manager (Winget) 
    to automate the installation process.

    This allowed for a silent and unattended installation of Krisp, providing a convenient and self-service option 
    for both individual users and on-site engineers.

<ins>Installing **Krisp** with *Windows Package Manager*</ins>: `winget`

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


    OPTION 2: Multiple Workstations, REMOTE Deployment
    
    For remote deployments, I packaged the Krisp installer into an .intunewin file, 
    uploading to `Microsoft Intune` for an available assignment.

    This allowed for the central management and distribution of Krisp to multiple workstations, 
    providing the flexibility to target specific users or device groups.

<ins>Intune Win32 Content Prep Tool</ins> to generate the **.IntuneWin** file:

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

`PowerShell` -script

<details><summary>IntuneWin32ContentPrep.ps1</summary>

```powershell
# Edit these variables to match your SETUP
$IntuneWinAppUtilFolder = "C:\Intune\3-IntuneWinAppUtil" # REPLACE with Intune Win32 Content Prep Tool location 
$SourceFolder = "C:\Intune\1-Krisp" # REPLACE with app setup file location 
$SetupFile = "Krisp_2.33.5" # REPLACE with name of app setup file
$OutputFolder = "C:\Intune\2-IntuneApps" # REPLACE with folder location to save IntuneWin file

# Change Directory
Set-Location -Path $IntuneWinAppUtilFolder

# Run Intune Win32 Content prep tool with parameters
& "$IntuneWinAppUtilFolder\IntuneWinAppUtil.exe" -c "$SourceFolder" -s "$SourceFolder\$SetupFile.exe" -o "$OutputFolder" -q

```
</details>
  
---

### 3️⃣ Training and Support:
During the training session, the client was concerned they wouldn't remember how to use the Password Manager, so I offered to create a video tutorial to serve as a reference, in case they ever forgot the correct action steps and needed reminding.  

To produce the Video Tutorial, I used an `AI Step Recorder` to capture my mouse movements and automate the screen recording and annotation process, demonstrating how to use the Password Manager. I produced the final video, using a `Video Editor` to include voice narration, subtitles and timestamps.

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

---

## 📊 Results:
Benefits for the client:
- 🤝 **Improved Meeting Productivity**
    - *(The password manager's autofill feature, will streamline the login process, <ins>saving the client time</ins> and <ins>reducing frustration</ins>)*.
    
- ⏱️ **Faster Resolution Times**
    - *(A centralised and synchronized password vault, will make it <ins>safer to access passwords accross different devices</ins>)*.
    
- 🔕 **Non-Intrusive Experience**
    - *(A video tutorial, will enable the client to troubleshoot issues on their own, <ins>reducing the reliance on external support</ins> and <ins>minimizing disruptions to their work</ins>)*.

---

## 🎉 Conclusion:
The client expressed their satisfaction with the Password Manager solution, appreciating its ease of use and positive impact on their daily work.

---
