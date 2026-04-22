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



     
