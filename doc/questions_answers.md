# Questions and Answers

## Current Idea
Questions are stored as individual entities having question text, a question type, an answer type, answer options, and an answer unit.

Answers are stored as entities related to a given question and having an answer type, and containing one or more answer values.

Questions are arranged in a graph format as question flows, with each edge stored in the database. Questions can be reused in graphs, as each edge has an associated question flow.

## Conditions
Conditions determine which one of the possible edges with parent_id = current question and question_flow_id = current question flow should be followed.

Conditions are (usually?) based on the answer to the current question.

*Conditions need a way to store the answer object as a variable. For now, conditions will be written in ruby code? `answer` will store conditions in the following examples.*

### Numeric Conditions
If the current question has an answer of a numeric type, conditions can be expressed as, for example, `answer > 3`.

### Answer Options
If the question has given answer option, a condition can be a subset of the allowed answer options.

example: `answer.answer_options.map(&id).subset?([2,3,6])`

If a single answer option is needed to be tested: `answer.answer_options.include?(2)`

### Default Conditions
All edges with a given question_id and a given question_flow_id are found.

If none of their conditions evaluate to true, **ERROR** (in development) and the flow continues to a random edge (in production).

A default edge can be set up by having a blank condition. This one will be followed if no other edges evaluate to true.

For simple question flows with no branching logic, for example, each edge would contain a blank condition.

## Issues
- How do we store generator quesitons, such as adding a set of questions for each person a user indicates as living with?

  Possible cyclic graph!!