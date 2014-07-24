# 0.5.1 (07/23/2014)
## Bug Fixes
- Style and design integration fixes.
- Updates to tests and documentation.

# 0.5.0 (07/16/2014)
## Enhancements
- Dashboard re-design.
- Research questions.
- Daily Trends
- Integration of MyApnea theme.

# 0.4.0 (07/14/2014)
## Enhancements
- Custom Report for A Little About Me Questionnaire.
- Enhancement of global report areas to involve user interaction.

## Refactoring
- Switch from Less to Sass to be ready for integration with MyApnea design.
- Re-factoring of Survey reports to include custom and global areas.


# 0.3.1 (07/10/2014)
## Bug Fixes
- Prevent automatic focus setting for unwanted form fields.
- Fix potential data leak in survey reports.
- Fix issues with listing of answers for reports.
- Enable Password Reset support.

# 0.3.0 (06/28/2014)

## Enhancements
- Implementation of Questionnaires
  - Question and Answer Model Implemented.
  - Questionnaires represented as Directed Acyclic Graphs.
  - Methods for calculating shortest and longest paths, completion percentages, status tracking.
  - Internationalization support.
  - Refined user interface and experience.

## Content
- A Little About Me questionnaire

# 0.2.0 (05/23/2014)
## Enhancements
- Upgraded to ruby 2.1.2
- Extracted every piece of static content into .yml files.
- Developed support for switching between locales and displaying the correct language.
- Added demonstration Polish translation for sign-in workflow and some of the Network page.

## Content
- Updated website static content with most recent IRB-approved material.

## Under Construction Page (05/13/2014)
- Sleep-related images found on Flickr and attributed to author using Creative Commons license.
- Design based on [BlackTie Countdown](http://www.blacktie.co/2014/03/counter-coming-soon-page/)
- Allows for gathering of mailing list information, including:
    - email
    - localization information based on IP address (Geocoder)
        - Country
        - State
        - Zip code

## 0.0.0
- Project initialization
    - Testing setup
    - Travis CI setup
    - Code Climate Setup
    - Gemnasium Setup
- Initial design and styling setup
    - Using Bootstrap 3.1.1 source
    - Flexible theme swapping based on Bootswatch themes
- Night and Day theme implementation
- Registration Functionality
    - Promise
    - Initial sign-up form
    - Consent form
        - Scrolling capability
        - Printing capability
- Sign-in Functionality
- Static Content
    - Pages Created:
        - FAQs
        - Network
        - Team
        - Splash Page
        - Privacy Policy
        - Thank You page

# 0.1.0
## Enhancements
  - Questionnaire Functionality implemented.
    = tables:
      - Questions
      - Answers
      - Question Flow
      - Answer Session
    - branching logic
    - intuitive user interface
  - Branching logic designed to be used by questionnaires.

## Bug Fixes
## Content
- New versions of consent, text, and layout implemented.
- Some text extracted into YAML files for easy update and internationalization.
    - Designed and implemented graph-based Questionnaire Data model.
        - Main Tables: 
            - Question Flows
            - Questions
            - Question Edges
            - Answer Sessions
            - Answers
            - Answer Edges
    - Features:
        - Conditional Branching
        - Progress tracking
        - Simple, intuitive user interface
    - Added a basic backend interface to serve as a foundation for future web-based modification and addition of questionnaires
    - Added two sample questionnaires to demo the functionality.
        - A little about me
        - Epworth
- Promise and Consent enforcement
    - Dates and times of signed promise and consent stored
    - Sign-up restricted if promise not accepted
    - Access to dashboard restricted if Consent not signed
- Visualization of questionnaire results
    - Simple pie-chart based visualization implemented using d3.js
        - Displays answer frequencies for each question and how they compare to user's answer