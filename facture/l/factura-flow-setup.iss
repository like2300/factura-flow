; Inno Setup Script for Factura Flow
; Download Inno Setup: https://jrsoftware.org/isdl.php

#define MyAppName "Factura Flow"
#define MyAppVersion "1.0"
#define MyAppPublisher "Factura Flow"
#define MyAppExeName "Factura Flow.exe"

[Setup]
; Basic settings
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=installer-output
OutputBaseFilename=FacturaFlow-Setup-{#MyAppVersion}
SetupIconFile=compiler:Icons\Open.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

; Architecture
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

; License
; LicenseFile=LICENSE

; Requirements
MinVersion=10.0.18362

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1; Check: not IsAdminInstallMode

[Files]
; Main executable
Source: "dist\Factura Flow.exe"; DestDir: "{app}"; Flags: ignoreversion

; Note: Don't include web folder - it's embedded in the exe by PyInstaller --onefile

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  
  // You can add custom checks here
  // For example, check if .NET Framework is installed
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Post-installation tasks
    // For example, create data directory
  end;
end;
