# ElectionBuddy Technical Test ("Code Challenge")

Mock-ElectionBuddy voters want to be able to see all changes the election administrator did to the election they are voting. You should create a human-readable election audit page that lists all updates to election settings, as well as any changes to questions, answers and voters for that election.

Your implementation should include a public audit page for every election in the system, as well as any abstraction you deem necessary. There are different value types that can be updated (dates, strings, serialized hashes) and each of those values should be appropriately formatted. You should also show information about who made the change and when the change was made.

No particular effort needs to be made on UI/UX as long as it's functional.

You'll note that most of the basic structure (`Election`, `Question`, `Answer`, `Voter`) is in place, with existing tests passing.

Please fork this repository on Github and push your code up to your own fork on Github when completed.

If you have any questions, email Brady at brady@electionbuddy.com.

Good luck!
