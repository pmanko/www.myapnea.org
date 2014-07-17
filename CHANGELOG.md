# 0.5.0

# 0.4.0

# 0.3.1

# 0.3.0

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