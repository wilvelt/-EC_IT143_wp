

/******************************************************************************************
NAME:        EC_IT143_6.3_fwt_s6_wp.sql
PURPOSE:     Ask the next question in the Fun with Triggers sequence

MODIFICATION LOG:
Ver         Date                Author              Description
1.0         08/08/2025          WPALANQUET          Begin logic for tracking who modified a record

NOTES:
We already track last_modified_date using a trigger.
Now we want to track last_modified_by using the server user name.
******************************************************************************************/

-- Question:
-- How do I set the “last modified by” to the server user?

-- Possible solution:
-- Use SUSER_NAME() or USER_NAME() in an AFTER UPDATE trigger.
