# Vibrato_Task

# Task
Write a small application in the language/framework of my choice to connect to a database, query it, and return the result to the user.

# Criteria
- Developed within a git repository with frequent commits
- Vagrant machine to spin up/down single machine environment
- OS installation/configuration (Windows or Linux, any versions)
- Configuration management (Chef, Puppet or Ansible) to install and configure applications
- Installation of a web tier and data tier (your choice, e.g. NGINX/Apache/IIS, MySQL/PostgreSQL/Redis/etc)
- Running a simple web application to query and return data

# Solution
- stack will be:
  - Chef
    - Apache
      - MySQL (not working, facing some issues)
      - Install as much from packages as possible
      - Modularize to keep the application maintainable

      # Instructions
      1. Clone repository
      2. Execute vagrant up
      3. Browse to http://172.11.11.11:80/



