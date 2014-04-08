# Data Model for Forms and Questionnaires

## Required features

### Questions
- Storage of question text
- Storage of question type
    * radio
- Storage of response type
    * numeric / text / datetime
    * single or multiple
- Storage of response options
    *

#### Fields
- question_text:string
- answer_type_id
- question_type_id

### Question_Answer_Options
#### Fields
- question_id
- answer_choice_id

### Answer_Option
#### Fields
- answer_value

**Can answer options be conditions as well??**
This would not work with combinational conditions, would it? In general, how would combinational condition work? Boolean logic?

### Question Flows: Templates
Templates are graph-like flows of questions.

- Flow name
- Origin question
- (parent, answer condition, child)

#### Fields

### Answer Flows: Sessions
Sessions are traversals of flows by users.

A given session associates a user with:
- A flow of answers that mirrors the flow of questions
    * Origin answer
    * (user, parent, child, answer time)

### Answers
- Storage of associated question id
- Storage of answer content
- Storage of timestamp



## Resources
- http://techportal.inviqa.com/2009/09/07/graphs-in-the-database-sql-meets-social-networks/