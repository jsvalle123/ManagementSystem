var mysql = require("mysql");
var inquirer = require("inquirer");
require("dotenv").config();
var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: process.env.MYSQL_PASSWORD,
  database: "employee_db"
});

connection.connect(function(err) {
  if (err) throw err;
  start();
});

function start() {
  inquirer
    .prompt({
      name: "view",
      type: "list",
      message: "What would you like to do?",
      choices: [
        "View all Employees",
        "View Employees by depertment",
        "View Employees by role",
        "Add Employee",
        "Remove Employee"
      ]
    })
    .then(function(answer) {
      if (answer.view === "View all Employess") {
        viewEmployees();
      } else if(answer.view === "View Employees by depertment") {
        viewDepartments();
      } else if (answer.view === "View Employees by role") {
        viewRole();
      } else if (answer.view === "Add Employee") {
        addEmployee();
      } else if (answer.view === "Delete employee") {
        deleteEmployee();
      } else {
        connection.end();
      }
    });
  }

  function viewEmployees() {
    var query = "SELECT first_name, last_name FROM employee";
    connection.query(query, [answer.first_name, answer.last_name], function(err, res) {
      for (var i = 0; i < res.length; i++) {
        console.log(
        "Name:" +
        res[i].first_name +
        res[i].last_name 
        )
      }
      start();
    });

  }
  function viewDepartments() {
    var query = "SELECT name FROM department";
    connection.query(query,  function(err, res) {
      if (err) throw err;
        console.log(res[i].name);
      
      start();
    });

  }
  function viewRole() {
    var query = "SELECT role FROM role GROUP BY title, salary";
    connection.query(query, function(err, res) {
      for (var i = 0; i < res.length; i++) {
        console.log(res[i].title);
        console.log(res[i].salary);
      }
      start();
    });

  }

  function addEmployee()  {
    inquirer
    .prompt([
      {
      name: "firstName",
      type: "input",
      message:"What is your first name?"
    },
    {
      name: "lastName",
      type: "input",
      message:"What is your last name?"
    },
    {
      name: "role",
      type: "input",
      message: "What is your role (title, and salary)?",
      validate: function(value) {
        if (isNaN(value) === false) {
          return true;
        }
        return false;
      }
    }

  ])
  .then(function(answer) {
    connection.query(
      "INSERT INTO employee SET ?",
      {
        first_name: answer.first_name,
        last_name: answer.last_name,
        role_id: answer.role_id

      },
      function(err) {
        if (err) throw err;
        console.log("You've been added as an employee")
      }
    )
    start();
  })
  }