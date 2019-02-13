# diskover_plusplus
By default, make sure to run commands in the ROOT directory of the project

## Frontend setup
```
npm install
npm run build
```

## Backend setup
Enter your Python virtual environment first
```
pip install -r requirements.txt
python manage.py migrate
```

## Working with frontend and backend in 2 separate ports
Most of the frontend files were constructed using Vue CLI 3 and are located in the "src" directory.
Run the following command to startup an auto-reload development server for frontend in http://localhost:8080
```
npm run serve
```
You may also want to startup the backend server to test api functionality.
Run the following command in another terminal to startup backend-api server in http://localhost:8000/api
```
python manage.py runserver
```
Most of the backend files are located in the "api" and "diskover_plusplus" directory


## Working with frontend and backend combined as a whole
Make sure to build the frontend files for production first.
```
npm run build
```
Also make sure to place your copy of the "static" folder holding all the important Diskover image files into the "api" directory.
The "api/static" directory was placed in the .gitignore so you have to manually update it everytime.
After building, The "dist" directory should now hold the index.html and other frontend production files. 
You can now run the whole webapp with:
```
python manage.py runserver
```
And the main page will be located in http://localhost:8000

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
