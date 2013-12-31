# a git hook to pickup todo from comment of your code and post as an issue to gitlab

now support .rb/.php/.java

## setup

**1. copy `todo.rb` to your PATH or somewhere not in your PATH**

**2. add a `post-commit` file to your hooks directory.**

  $ cat .git/hooks/post-commit
  exec todo.rb

**3. set gitlab url and private token**

  export GITLAB_HOST = ...  
  export GITLAB_TOKEN = ...

## how to use

write comment in your code like this:


```
// [TODO: xxxxx ]
```

or

```
/** [TODO: yyyyy ] */
```
or

```
# [TODO: zzzzz ]
```

and this will add an issue {:title => xxxx, :description => file_name, :assignee_id => your_user_id, labels => 'todo' } to your gitlab repos.


## feedback

  liubin0329@gmail.com

## copyright & license

Copyright bin liu liubin0329@gmail.com

License: MIT License
