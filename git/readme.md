# Git Configuration

## Initial Setup

```
cp repositories.example.txt repositories.txt
vim repositories.txt
```

Add your own repositories and custom folder names by matching the formatting here.

When you're ready to apply them, run [setup.sh](setup.sh):

```
./setup.sh
```

## Customisation

In [setup.sh](setup.sh), you can:

- Alter the folder the repositories are cloned in to by updating the `GIT_REPOSITORY_FOLDER` variable
- Alter the repository Markdown file location by updating the `GIT_REPOSITORY_LIST` variable
