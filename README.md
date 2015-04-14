# gitmate

Idea is to get as much of github "power" to command line. So I don't have to go to github.com to read notifications, create Issues or Pull Requests.

## Usage

These are currently supported commands:
- Get inspirational quote from github:
 
`gitmate zen`

- Get general information about the user:

`gitmate user -n, [--name] <github_user_name>`

 
- Get list of repositories for a user (This command requires github password):

`gitmate repos <github_user_name> -l, [--list]`



## Gems used
I used [Thor](https://github.com/erikhuda/thor) to develop this application. At the moment I am using `curl` to issue requests to github API, maybe I'll go with something like [Mechanize](https://github.com/sparklemotion/mechanize) later. Did try NET::HTTP ruby library but sending JSON in POST requests posed problem I could not solve.
