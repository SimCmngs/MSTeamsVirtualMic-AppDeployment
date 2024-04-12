# Resolving Microphone Issues with Noise Suppression App - for Microsoft Teams

This was a project I completed during my bootcamp training, helping a co-student (install software) to suppress the background noises their microphone was picking up during our Zoom call sessions. 

I've re-created this project to work in an IT corporate setting, changing the video/conferencing platform from Zoom to Microsoft Teams and recreating this issue as a support ticket. 

This project aims to resolve the issue of "disruptive background noises" during virtual meetings and calls, by deploying a Virtual Microphone/Noise Suppression solution that easily integrates with Microsoft Teams.

![Logo](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/th5xamgrr6se0x5ro4g6.png)

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

> **VGM-LAB Game Dev Studios** - an independant video game development company, facing a significant challenge in maintaining effective virtual collaboration and communication as its <ins>reliance on remote work</ins> and <ins>Microsoft Teams</ins> has increased.

The company's open office layout and lack of soundproofing means that remote employees' microphones are picking up <ins>distracting background noise</ins> from their on-site colleagues' conversations and surrounding office equipment. 

This issue was further escalated by the fact that some of **VGM LAB**'s remote employees were working from home offices with poor acoustics, experiencing issues with <ins>voice echoes</ins> and <ins>room reverb</ins>, causing confusion during virtual meetings.

To make matters worse, **VGM LAB**'s clients were also experiencing <ins>poor audio quality</ins> during video calls and product demonstrations, making it difficult for them to hear and understand the game developers.

### 🏢 Company Background:
- The client is a small-sized Game Development company, outsourcing the management of their IT services to our Cloud Support Team.
- Their reliance on remote meetings has increased due to more team members working from home, with Microsoft Teams being their primary platform for virtual collaboration.
- Frustrations include poor microphone/audio quality and background noises disrupting the flow of virtual calls and meetings.

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## ⛔ Problem Statement:
Our Support Team received a high volume of tickets related to microphone issues in Microsoft Teams. The problems ranged from:

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

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

---

# 💻 Implementation:

### 1️⃣ Evaluation and Testing:
I created a test enviroment, using `Hyper-V` virtual machines to mimic the users' Microsoft Teams setup. This included the exact software configurations, hardware specs and room conditions that the end-users would be using.


[i.] <ins>**Local Users' desktop environment**</ins>

<details><summary>VM 1 checklist</summary>

  `On-Prem VM`
  - [x] **OS**: `Windows 11`
  - [x] **Hardware Specs**: CPU: *2 cores* | RAM: *8GB (8192)* | HDD1: *256GB*
  - [x] **User/Device Management**: local `Active Directory` on `Windows Server OS`
  - [x] **Teams Setup**: `Teams` <ins>(classic)</ins>

</details>

[ii.] <ins>**Remote Users' desktop environment**</ins>

<details><summary>VM 2 checklist</summary>

  `Cloud VM`
  - [x] **OS**: `Windows 11`
  - [x] **Hardware Specs**: CPU: *2 cores* | RAM: *8GB (8192)* | HDD1: *256GB*
  - [x] **User/Device Management**: `Microsoft Entra ID` / `Intune`
  - [x] **License**: `Microsoft 365` E5 
  - [x] **Teams Setup**: `Teams` <ins>(new)</ins>

</details>

> [!IMPORTANT]
> **Drop-down sections above** (^) - expand for more info.

---

### 2️⃣ Software Deployment:
I created 2 deployment options for installing Krisp, to work for each use-case scenario.

Because TeamViewer lacked a built-in, voice calling feature, I used Zoom instead to communicate with the client. Providing timely responses to their requests and questions.

`PowerShell` 

<ins>Installing **Bitwarden** with *Windows Package Manager*</ins>: `winget`

```powershell
# Check if winget is installed
$wingetInstalled = Get-Command winget -ErrorAction SilentlyContinue

# Install winget if it's not installed
if (-not $wingetInstalled) {
    Write-Host "Installing winget..."
    Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle" -OutFile "$env:TEMP\winget.appxbundle"
    Add-AppxPackage -Path "$env:TEMP\winget.appxbundle"
    Write-Host "winget installed successfully."
}

# Install Bitwarden using winget
Write-Host "Installing Bitwarden..."
winget install Bitwarden.Bitwarden -e
Write-Host "Bitwarden installed successfully."

```
> [!NOTE]
> This script automates the downloading and silent installation of Bitwarden, reducing the manual effort and time needed to search for and run the installer.

---

### 3️⃣ Training and Support:
During the training session, the client was concerned they wouldn't remember how to use the Password Manager, so I offered to create a video tutorial to serve as a reference, in case they ever forgot the correct action steps and needed reminding.  

To produce the Video Tutorial, I used an `AI Step Recorder` to capture my mouse movements and automate the screen recording and annotation process, demonstrating how to use the Password Manager. I produced the final video, using a `Video Editor` to include voice narration, subtitles and timestamps.

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

---

## 📊 Results:
Benefits for the client:
- 🚀 **Enhanced workflow and ease-of-use**
    - *(The password manager's autofill feature, will streamline the login process, <ins>saving the client time</ins> and <ins>reducing frustration</ins>)*.
    
- 🔒 **Improved security**
    - *(A centralised and synchronized password vault, will make it <ins>safer to access passwords accross different devices</ins>)*.
    
- 🧠 **Increased self-reliance**
    - *(A video tutorial, will enable the client to troubleshoot issues on their own, <ins>reducing the reliance on external support</ins> and <ins>minimizing disruptions to their work</ins>)*.

---

## 🎉 Conclusion:
The client expressed their satisfaction with the Password Manager solution, appreciating its ease of use and positive impact on their daily work.

---
