Helpful/Fun Scripts
===================

These are a handful of scripts I write in my free time to handle tasks
that require substantial manual effort.

Utility Splitter
----------------

The util_splitter script was created because I was living with multiple tenants
where each tenant handled different utilities and paid different rent amounts.
Figuring out how much each person owed the other every month became daunting and
frustrating. 

This script takes a hash of tenants and their subsequent rent and a hash
of utilities, who handles paying them and how much they cost. Once run, it will output
which tenant owes the other tenant and how much. I've also added how much each tenant should
pay including utilities, the total utility cost and the split of the utilities.

    $ [sudo] ruby util_splitter.rb