![Ruby](https://github.com/carlosMoreno357/required_office_stuff/workflows/Ruby/badge.svg?branch=master)
# README

## Required office stuff
https://gentle-island-80820.herokuapp.com/

This system allows to request office supplies for different categories, along with a comment posting feature and user the capability to edit users and change the requested items status.

### Accounts management
Account types are only two: common users and administrator users.
To set an user as an administrator, after its registration, the `:admin` database column must be updated to `true`

### E-mail sender feature
Every time users need to be notified by an item request or status change of the mentioned, they will received an email from `tango.stuff.requirements@gmail.com` address
