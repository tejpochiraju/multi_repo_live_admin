# Demo of LiveAdmin's MultiRepo Capabilities

- LiveAdmin supports multiple repos out of the box because Ecto.Repo supports multiple repos out of the box. 
    - See [this issue](https://github.com/tfwright/live_admin/issues/34#issuecomment-1545533400) for a description.
- This git repository has 2 apps: `AppB` which contains a simple `User` schema and `AppA` which contains schemas for `Role` and `UserRoleMapping`.
- We are using SQLite3 here for simplicity but this works with PostgreSQL too. 
- `AppA` depends on `AppB` to implement `UserRoleMapping`. To achieve this, we are going to configure the 2 apps to use the same DB file.
    - Not really relevant to this demo but we are going to prevent `AppB` from starting its endpoint when run in `AppA`'s supervision tree.
- We will install and configure `live_admin` in `AppA` to access schemas from both apps.
- Each step is documented as a commit so use the commits to follow along.


## Steps

_NB - `cd` and similar commands skipped for brevity.`

```
mix phx.new app_b --database sqlite3
mix phx.gen.json Accounts User users name email
mix phx.new app_a --database sqlite3
# In AppA
mix phx.gen.json Admin Role roles name
mix phx.gen.json Admin UserRoleMapping user_role_mappings user_id:references:users role_id:references:roles
# At this point, the migration will fail because AppA doesn't know about `users` yet.
# Add `:app_b` as dependency and make changes to `config.exs` and `dev.exs` to link the repos and make both use the same DB file.
# Configure AppB so that it doesn't start its endpoint when run in AppA's supervision tree.
```
