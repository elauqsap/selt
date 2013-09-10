hw1
===

Skeleton code and sanity specs for homework 1, fall 2013

Skeleton Code
=============

The skeleton code files for parts 1-5 are located in `skeleton_code/`directory .

Running Sanity Specs
====================

To run the sanity specs, please make sure `rspec` is installed.
To install rspec, run

    sudo gem install rspec

If you have your solution saved to a file located at `path/to/solution.rb`, and
the corresponding spec is located at `other_path/to/sanity_spec.rb`, then you can run
the sanity spec with:

    rspec path/to/solution.rb other_path/to/sanity_spec.rb

The output should look something like:

    ...

    Finished in 0.00206 seconds
    3 examples, 0 failures

    NOTE: Passing the sanity check does not, in any way, insure that your code is
    correct.  The sanity check simply insures that your code conforms to the basic
    specificaton necessary to be tested by our automated testing tools.
