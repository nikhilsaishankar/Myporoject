Overview:
This project follows the Git Flow Branching Strategy — a proven model that keeps production code stable, development organized, and releases predictable. The branching structure is designed to seamlessly integrate with a CI/CD pipeline, enabling automated builds, testing, and deployments triggered directly from branch activity. While CI/CD pipeline integration is planned for a future phase, the current workflow defines the branching structure and manual deployment process in alignment with those upcoming automation standards, ensuring a smooth transition once the pipeline is in place.


1.1 Branch Overview:
main
 └── develop
       └── feature/your-feature-name
             └── release/v1.0.0
                   └── (merge to main)

main
 └── hotfix/critical-bug-fix
       └── (merge back to main + develop)


1.2  Branch Structure & Flow :

  1. main — Production Branch
      This is your live, production-ready code. Every commit here represents a stable release that is running for real users. No developer
      should directly touch this branch. Code only enters main through a controlled merge from release or hotfix branches.

  2. develop — Integration Branch
    Taken from: main
    When the project starts (or after every production release), develop is created as an exact replica of main. This is the main working branch     for the team. All feature branches are created from here, and all finished features come back here first.
    Think of develop as the staging ground — it reflects what the next release will look like.

  3. feature/* — Feature Branches
     Taken from: develop
     Merged back to: develop

     Whenever a new feature needs to be built, a developer creates a fresh branch from develop.
     Naming convention:
       feature/user-authentication
       feature/payment-gateway
       feature/dashboard-redesign

     Workflow:
     Developer builds and tests the feature locally.
     Once it's working, a Pull Request (PR) is raised to merge back into develop.
     After code review and approval, it gets merged into develop.

 4. release/* — Release Branch
      Taken from: develop
      Merged to: main (and back to develop)

      Once all features for a release are merged into develop and the dev team is confident, a release branch is created. This is handed over to
      the QA / Testing Team.
 
   What happens here:
     The testing team verifies all features are working correctly.
     If tests pass → The release branch is merged into main (goes live).
     If tests fail → Bugs are reported back to the dev team, fixes are made and re-deployed on the release branch.

   After a successful merge to main, the latest main is pulled into develop to keep them in sync.
     Naming convention:
        release/v1.0.0
        release/v1.2.0

 5. hotfix/* — Hotfix Branch
    Taken from: main
    Merged to: main + develop

   Sometimes things break in production. When a critical bug is found on main, a hotfix branch is created directly from main — not from develop.    This allows the team to fix the issue without picking up any unfinished work from develop.
   Workflow:
     Developer creates a hotfix branch from main.
     Bug is diagnosed and fixed.
     Fix is tested and verified.
     The hotfix branch is merged back into main (to fix production immediately).
     The same fix is also merged into develop (to keep both branches in sync).

   Naming convention:
     hotfix/fix-payment-crash
     hotfix/fix-login-token-expiry



2 Full Flow — Step by Step

        main ──────────────────────────────────── (stable production)
         │
         └──► develop ──────────────────────── (replica of main)
                  │
                  └──► feature/xyz ──────────── (new feature work)
                           │
                           └──► develop ──────── (feature merged back)
                                    │
                                    └──► release/v1.0.0
                                              │
                                    ┌─────────┴──────────┐
                                    │                    │
                                Tests Pass           Tests Fail
                                    │                    │
                               merge to main        back to devs
                                    │                    │
                               main (live)        fix → re-release
                                    │
                               pull latest main into develop

─── If production breaks ───

     main ──► hotfix/critical-fix ──► merge to main
                                          │
                                  merge to develop


3. CI/CD Pipeline — Jenkins with Slave Nodes
    Now that we understand the branching strategy, let's talk about how the code actually moves from a developer's machine all the way to           production. We use Jenkins as our CI/CD server, and every environment gets its own dedicated Slave Node — so nothing is shared, nothing         bleeds across environments.


   Infrastructure Overview
   We have one Jenkins Master and four dedicated servers, each mapped to a specific environment:
   Environment                         Server Setup                                                             Jenkins Slave Label
   Dev                               Tomcat (App Server only)                                                             dev
   Test                              Tomcat + Nexus (Artifact Storage)                                                    test
   UAT                               Tomcat + Nexus (Artifact Storage)                                                    uat
   Prod                              Tomcat + Nexus (Artifact Storage)                                                    prod
   
Each server is registered in Jenkins as a Slave Node with a matching label. When a pipeline runs, Jenkins looks at the label and runs the job on exactly the right server — no mix-ups.

4. How the Pipeline Works — Environment by Environment
   Code Checkout (develop branch)
        │
        ▼
     Build
  (Compile & Package)
        │
        ▼
     Test
  (Unit Tests)
        │
        ▼
    Deploy
  (Deploy to Dev Tomcat Server)
        │
        ▼
  Dev Team Verifies
  ✅ Application is live on Dev Server
  ✅ Security groups, ports, endpoints — all checked
  ✅ Dev gives the green light
        │
        ▼
  Push changes to release/* branch     

The developer checks the running application on the Dev Server. If everything looks good — the feature works, ports are open, endpoints respond correctly — they push those changes forward to the release branch.


5. TEST Environment
Branch: release/* → Node Label: test
The release branch pipeline is similar to Dev, but with two important additions — Nexus for artifact storage and a manual approval gate before deployment.
Code Checkout (release/* branch)
        │
        ▼
     Build
  (Compile & Package)
        │
        ▼
  Publish Artifact to Nexus
  (Versioned artifact stored safely)
        │
        ▼
     Test
  (Automated Tests)
        │
        ▼
  ⏸️  INPUT STAGE — Waiting for Approval
  "Deploy to Test Environment?" → Manager Approves ✅
        │
        ▼
  Deploy to Test Server
  (Pull artifact from Nexus → Deploy on Tomcat)
        │
        ▼
  QA Team Tests the Application
        │
   ┌────┴────┐
   │         │
Pass        Fail
   │         │
   ▼         ▼
Proceed   Report bugs → Dev fixes →
to UAT    Re-run pipeline on release branch
The key thing here is the manual approval step. The pipeline pauses and waits for a manager or lead to approve before anything is deployed to the Test Server. This gives the team control — nothing gets pushed without a human sign-off.


5.2 UAT Environment
Branch: release/* → Node Label: uat
UAT follows the same pattern as Test. The business team or client validates the features in a production-like environment. If UAT passes, the release branch is merged into main. If changes are needed, they go back to the dev team.
Code Checkout (release/* branch)
        │
        ▼
  Build + Nexus Artifact
        │
        ▼
  ⏸️  INPUT STAGE — Manager Approval
        │
        ▼
  Deploy to UAT Server
        │
        ▼
  Business / Client Validation
        │
   ┌────┴────┐
   │         │
Pass        Fail
   │         │
   ▼         ▼
Merge      Back to Dev Team
release → main


5.3 PROD Environment
Branch: main → Node Label: prod
Production is the final destination. Once the release branch is merged into main, the production pipeline runs against the main branch on the prod slave node. Same pipeline structure — build, artifact, approval, deploy.

Code Checkout (main branch)
        │
        ▼
  Build + Nexus Artifact
        │
        ▼
  ⏸️  INPUT STAGE — Final Approval
        │
        ▼
  Deploy to Prod Server
        │
        ▼
Application Live in Production


6. Full CI/CD Flow — Bird's Eye View
   Developer pushes code
        │
        ▼
  Jenkins detects branch
        │
   ┌────┴──────────────────────────────────┐
   │                                       │
develop branch                        main branch
(Dev Pipeline)                       (Prod Pipeline)
   │                                       │
   ▼                                       ▼
Slave Node: dev                    Slave Node: prod
Build → Test → Deploy Dev          Build → Artifact → Approve → Deploy Prod
   │
   ▼
Dev ✅ → push to release/*
   │
   ▼
Slave Node: test
Build → Artifact (Nexus) → Approve → Deploy Test
   │
   ▼
QA ✅ → same release/* branch
   │
   ▼
Slave Node: uat
Build → Artifact (Nexus) → Approve → Deploy UAT
   │
   ▼
UAT ✅ → Merge release/* → main
   │
   ▼
Slave Node: prod
Build → Artifact (Nexus) → Approve → Deploy Prod


Pipeline Stages Summary
Every Jenkins pipeline across all environments follows these core stages:
StageDescriptionCheckoutPull code from the correct Git branchBuildCompile the code and package it (e.g., .war / .jar)TestRun automated unit/integration testsArtifactPush build artifact to Nexus (Test / UAT / Prod only)ApprovalManual input gate — manager approves before deploy (Test / UAT / Prod)DeployDeploy artifact to the environment's Tomcat server
