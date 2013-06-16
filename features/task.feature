Feature: Simple Task Creration
  In order to assign a task to a staff member
  As a manager
  I want to create a task

Background:
  Given the following staff members exist:
  | id | name           | email                      |
  |  1 | James Smith    | james.smith@example.org    |
  |  2 | Phil Green     | phil.green@example.org     |
  |  3 | Geoff Jones    | geoff.jones@example.org    |

  Given the following teams exist:
  | id | name             |
  |  1 | Development      |
  |  2 | Network          |
  |  3 | Customer Support |

  Given following Milestone sheet exists:
  | id | staff_member_id | team_id | week_commencing |
  |  1 |               3 |       1 | 17/06/2013      |
  |  2 |               2 |       1 | 17/06/2013      |

Scenario: Creating a task
  Given I am on the homepage
  And I visit "/milestone_sheets"
  And I visit "/milestone_sheets/1"
  And I follow "Add Task"
  And I fill in following task details:
  | title           | Sample Task Title                       |
  | description     | This is more detailed task description. |
  | completion_date | 27/06/2013                              |
  And press "Submit"
  Then I should be on "/milestone_sheets/1"
  And I should see "Sample Task Title"
  And should see "27/06/2013"
