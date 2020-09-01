SportsHunt:

Number of lines of code - 5000

Steps to Deploy project:
1. PostgreSQL Database (Relational Database):
	Open PgAdmin4
	Restore "SportsHunt_PostgreSQL_DB_schema.sql" file present in the folder structure. (Database Schema)
	
2. Elasticsearch (No-SQL Database):
	Start Elasticsearch service on server.
	
3. Python Script:
	open folder "backend-build-divvy-status".
	Run "divvy_real-time_status.ipynb" file using Jupyter Notebook.
	
4. Nodejs (Server - Backend):
	Open "sportshunt_backend" folder in terminal / command prompt
	Run command "npm install" (It will install all required npm packages for server/ nodejs)
	Run command "node server.js" (It will print status of Nodejs, PostgreSQL, Elasticsearch on console)
	
5. Angular 9 (Client - Frontend):
	Open "sportshunt_frontend" folder in terminal / command prompt
	Run command "npm install" (It will install all required npm packages for client/ Angular 9)
	Run command "ng serve --open"