Test Evidence
=============

This folder contains test evidence (TRX files and screenshots) and a small script to re-run tests locally.

Files
- run-tests.ps1 - PowerShell script that runs the test project and writes TestResults.trx into this folder.
- TestResults.trx - TRX result file (if present).
- TestExplorerPassed.png - Screenshot of Visual Studio Test Explorer showing passing tests (optional).

How to re-create the TRX locally
1. Open PowerShell and change to the repository root (one level above the Documentation folder).
2. Run:
   .\Documentation\TestEvidence\run-tests.ps1

The script will attempt to locate TechMove.Tests.csproj (or any *.Tests.csproj) and run dotnet test. The TRX will be written into this folder.

If you prefer to run tests from Visual Studio, open Test Explorer and run All Tests; then save screenshots into this folder.
