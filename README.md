# Documentation
- [Introduction](#introduction)
- [Create containers](#create-containers)
- [Create project](#create-project)
- [Permissions](#permissions)
- [Migration](#migration)
- [Run server](#run-server)

<a name="introduction"></a>
## Instructions
This is a simple example how to use docker with django. You may change the database credentials, network name,
container names and image names on `docker-compose.yml` how is convenient for you.  

<a name="create-containers"></a>
## Create containers `docker-compose` 
Create the container by using `docker-compose` 

    doocker-compose build web
    docker-compose up -d

<a name="create-project"></a>
## Create a new project ##
If you are starting from the scratch create new django project

    docker exec django-web django-admin startproject mysite .

or if this doesn't work for you get inside the container and create the project from there
    
    docker exec -it django-web bash
    django-admin startproject mysite .

The project is going to be created within the ***app*** folder.

<a name="permissions"></a>
## Permissions
If you are using linux and you don't have permission on you host in cases when you create a new app use the following 
command to make your user a owner:
 
    sudo chown -R $USER:$USER .

## Database settings
Change the database settings in your `settings.py`. For example:
    
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'django-test',
            'USER': 'jethax',
            'PASSWORD': '1234',
            'HOST': 'django-mysql',
            'PORT': '3306',
        }
    }

<a name="migration"></a>
## Migration
To run the migration login in the container:

    docker exec -it django-web bash

After you are inside the container run the migration:

    python manage.py migrate

<a name="run-server"></a>    
## Run server
### Option 1
Use the following command to run the server (Enter the command from your host)

    docker exec -it django-web python manage.py runserver 0.0.0.0:8000

### Option 2
To run the server on container start on `docker-composer.yml` find the command:
    
    command: tail -f /dev/null

and change it to:

    command: python manage.py runserver 0.0.0.0:8000 
    
The first option is more preferable since usually you want to see the terminal errors.